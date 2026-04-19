# Guide to getting started walking source codes of CRuby

## About Me

## The CRuby Adventure Book

![small](images/cover_outline_6.8.jpg)

## How to Read CRuby Source Code

- General tips for reading C code, regardless of CRuby
- CRuby-specific details

## General Tips for Reading C Code (Regardless of CRuby)

- Aim to get a rough overview first
- Narrow down the areas you need to read

## Tip 1

Identify sections you can skip

## `#ifdef - #endif`

Determined at compile time
Usually for options or specific environments (JIT, WASM, etc.)
Occasionally, some are enabled by default, so be aware of anything that seems out of place

## Error handling

If you find something like assert(), skip it

## Option handling

Some set flags, so memorizing option flags makes it easier to skip over them later

## Debugging-related

This is common with `#ifdef`, but flags are sometimes used in option handling as well

Sections unrelated to what you want to know
Since the relevance is often low, you may want to come back to them later, but it’s fine to skip them initially

## Tip 2: Start with the Purpose

For large functions, read from the bottom

Most often, they end with `return <objective>`.
The return value is usually the objective.
Conversely, the beginning often contains error handling (asserts, early returns) or setup.
Don’t read the setup at first. If you do read it, make sure you know the objective first.

## Tip 3: Knowledge of the Target Is Important

If you know what the program does or have knowledge of the algorithm, you can read it.
However, you may not need to read it at all.

---

The CRuby parser consists of `parse.y` and `prism`.
It’s also important to know the name “prism.”

Modular GC and mmtk

## CRuby-Specific Considerations

Things to know to make reading CRuby source code easier:

- The `VALUE` type
- The `rb_define_method()` function
- `insns.def`

## The `VALUE` Type

It appears all over the place in CRuby’s source code

```
% git grep VALUE | wc -l
34190
```

---

It represents a Ruby object

It has three uses

- As a pointer to a Ruby object
- As an immediate value
- As a special constant

## Literal Values

| Object         | Structure       | Description                              |
| -------------- | --------------- | -------------------------                |
| Integer        | `...xxxxxxx1`   | Small integers in the high-order bits    |
| Flonum         | `...xxxxxx10`   | Part of a double in a 64-bit environment |
| Symbol         | `...00001110`   | Symbol object ID                         |

## Special Constants

| Object  | Value  | C Constant |
|---------|--------|------------|
| `false` | `0x00` | `Qfalse`   |
| `nil`   | `0x08` | `Qnil`     |
| `true`  | `0x14` | `Qtrue`    |

## `rb_deine_method()` function

Defining C Functions as Ruby Methods

How are Ruby methods implemented within CRuby?

```c
rb_define_method(rb_cISeq, "to_binary", iseqw_to_binary, -1);
```

## `insns.def`

ISeq instructions are defined

Various other files are generated from this file

## The Ultimate Secret

%huge: AI

I learned about the `VALUE` type from Gemini

## Claude Code

- Can be run in the source code repository
  - Can lock the code version
- Set the language to “gal-speak”

## What I Learned Using Claude Code

- Call Cache
- Object Shape

## How are Ruby methods called?

In ISeq, method calls correspond to instructions such as `send` and `opt_send_without_block`.

---

[file insns.def:892]

```c
/* Invoke method without block */
DEFINE_INSN
opt_send_without_block
(CALL_DATA cd)
(...)
(VALUE val)
// attr bool zjit_profile = true;
// attr bool handles_sp = true;
// attr rb_snum_t sp_inc = sp_inc_of_sendish(cd->ci);
// attr rb_snum_t comptime_sp_inc = sp_inc_of_sendish(ci);
{
    VALUE bh = VM_BLOCK_HANDLER_NONE;
    val = vm_sendish(ec, GET_CFP(), cd, bh, mexp_search_method);
    JIT_EXEC(ec, val);

    if (UNDEF_P(val)) {
        RESTORE_REGS();
        NEXT_INSN();
    }
}
```

---

In C, `vm_sendish()` serves as the entry point

[file vm_insnhelper.c:6123]

```c
        calling.cc = cc = vm_search_method_fastpath((VALUE)reg_cfp->iseq, cd, CLASS_OF(recv));
        val = vm_cc_call(cc)(ec, GET_CFP(), &calling);
```
Retrieving the callcache (`cc`)

As the name suggests, callcache speeds up operations through caching.

---

[file vm_insnhelper.c:2356]

```c
static const struct rb_callcache *
vm_search_method_fastpath(VALUE cd_owner, struct rb_call_data *cd, VALUE klass)
{
    const struct rb_callcache *cc = cd->cc;

#if OPT_INLINE_METHOD_CACHE
    if (LIKELY(vm_cc_class_check(cc, klass))) {
        if (LIKELY(!METHOD_ENTRY_INVALIDATED(vm_cc_cme(cc)))) {
            VM_ASSERT(callable_method_entry_p(vm_cc_cme(cc)));
            RB_DEBUG_COUNTER_INC(mc_inline_hit);
            VM_ASSERT(vm_cc_cme(cc) == NULL ||                        // not found
                      (vm_ci_flag(cd->ci) & VM_CALL_SUPER) ||         // search_super w/ define_method
                      vm_cc_cme(cc)->called_id == vm_ci_mid(cd->ci)); // cme->called_id == ci->mid

            return cc;
        }
        RB_DEBUG_COUNTER_INC(mc_inline_miss_invalidated);
    }
    else {
        RB_DEBUG_COUNTER_INC(mc_inline_miss_klass);
    }
#endif

    return vm_search_method_slowpath0(cd_owner, cd, klass);
}
```

---

If `cd->cc` contains a callcache, use it.
If there is no callcache, call `vm_search_method_slowpath0()` and set the callcache as well.

## What is `call_data`

It contains information about which method to call in response to method calls such as `send` or `opt_send_without_block` in ISeq.

---

```
vm_search_method_slowpath0
└── rb_vm_search_method_slowpath
    └── vm_search_cc
```

`vm_search_cc()` is called

---

[file vm_insnhelper.c:2267]

```c
static const struct rb_callcache *
vm_search_cc(const VALUE klass, const struct rb_callinfo * const ci)
{
    const ID mid = vm_ci_mid(ci);

    const struct rb_callcache *cc = vm_lookup_cc(klass, ci, mid);
    if (cc) {
        return cc;
    }

    RB_VM_LOCKING() {
        if (rb_multi_ractor_p()) {
            // The CC may have been populated by another ractor while we were waiting on the lock,
            // so we must lookup a second time.
            cc = vm_lookup_cc(klass, ci, mid);
        }

        if (!cc) {
            cc = vm_populate_cc(klass, ci, mid);
        }
    }

    return cc;
}
```

---

`vm_lookup_cc()` looks up `cc` in `RCLASS_WRITABLE_CC_TBL`
`RCLASS_WRITABLE_CC_TBL` is an extension area associated with the class
`vm_populate_cc()` creates `cc` and writes it to `RCLASS_WRITABLE_CC_TBL`

## How the callcache Works

- The first call creates a callcache and stores it in `RCLASS_WRITABLE_CC_TBL`. It is also stored in `call_data`.
- The second call uses `call_data->cc`.
- If a different `call_data` is used, the callcache is retrieved from `RCLASS_WRITABLE_CC_TBL` and stored in `call_data`.

---

図を入れる

## Object Shape

Data structures for managing instance variables (`ivar`)

## How `ivar`s are managed

Object creation

```c
rb_define_alloc_func(rb_cBasicObject, rb_class_allocate_instance);
```

```c
NEWOBJ_OF_WITH_SHAPE(o, struct RObject, klass, flags, rb_shape_root(rb_gc_heap_id_for_size(size)), size, 0);
```

## RObject

```c
struct RObject {
    struct RBasic basic;
    union {
        struct {
            VALUE *fields;
        } heap;

        VALUE ary[1];
    } as;
};
```

`ivar` is stored in `as.ary`

## Generation of `ivar`

`ivar` is generated dynamically

For example, if there is a class like the one below, simply calling `MyClass.new` will not create `@bar`
`as.ary` に `ivar` が保存される

```ruby
class MyClass
  def initialize
    @foo = :foo
  end

  def bar
    @bar = :bar
  end
end
```

## Shape

`ivar` is stored in `as.ary` (or `as.heap`) in the order in which it was created.
Shape keeps track of the order in which `ivar` was created.

---

```c
struct rb_shape {
    VALUE edges; // id_table from ID (ivar) to next shape
    ID edge_name; // ID (ivar) for transition from parent to rb_shape
    redblack_node_t *ancestor_index;
    shape_id_t parent_id;
    attr_index_t next_field_index; // Fields are either ivars or internal properties like `object_id`
    attr_index_t capacity; // Total capacity of the object with this shape
    uint8_t type;
};
```

---

| Field Name       | Description                      |
|------------------|----------------------------------|
| edges            | Mapping to the destination shape |
| edge_name        | ivar name (`@foo`)               |
| parent_id        | Parent shape ID                  |
| next_field_index | Index of the next destination    |

---

```
root
└── shape_id = 1 (edge_name: 'foo', next_field_index: 1)
    └── shape_id = 2 (edge_name: 'bar', next_field_index: 2)
```




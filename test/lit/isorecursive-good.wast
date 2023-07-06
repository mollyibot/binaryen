;; NOTE: Assertions have been generated by update_lit_checks.py and should not be edited.

;; RUN: wasm-opt %s -all -S -o - | filecheck %s --check-prefix HYBRID
;; RUN: wasm-opt %s -all --roundtrip -S -o - | filecheck %s --check-prefix HYBRID

(module
  (rec
    ;; HYBRID:      (rec
    ;; HYBRID-NEXT:  (type $super-struct (struct (field i32)))
    (type $super-struct (struct i32))
    ;; NOMINAL:      (type $sub-struct (struct_subtype (field i32) (field i64) $super-struct))
    ;; HYBRID:       (type $sub-struct (sub $super-struct (struct (field i32) (field i64))))
    (type $sub-struct (sub $super-struct (struct i32 i64)))
  )

  (rec
    ;; HYBRID:      (rec
    ;; HYBRID-NEXT:  (type $super-array (array (ref $super-struct)))
    (type $super-array (array (ref $super-struct)))
    ;; HYBRID:       (type $sub-array (sub $super-array (array (ref $sub-struct))))
    (type $sub-array (sub $super-array (array (ref $sub-struct))))
  )

  (rec
    ;; HYBRID:      (rec
    ;; HYBRID-NEXT:  (type $super-func (func (param (ref $sub-array)) (result (ref $super-array))))
    (type $super-func (func (param (ref $sub-array)) (result (ref $super-array))))
    ;; NOMINAL:      (type $sub-func (func_subtype (param (ref $super-array)) (result (ref $sub-array)) $super-func))
    ;; HYBRID:       (type $sub-func (sub $super-func (func (param (ref $super-array)) (result (ref $sub-array)))))
    (type $sub-func (sub $super-func (func (param (ref $super-array)) (result (ref $sub-array)))))
  )

  ;; HYBRID:      (func $make-super-struct (type $none_=>_ref|$super-struct|) (result (ref $super-struct))
  ;; HYBRID-NEXT:  (call $make-sub-struct)
  ;; HYBRID-NEXT: )
  (func $make-super-struct (result (ref $super-struct))
    (call $make-sub-struct)
  )

  ;; HYBRID:      (func $make-sub-struct (type $none_=>_ref|$sub-struct|) (result (ref $sub-struct))
  ;; HYBRID-NEXT:  (unreachable)
  ;; HYBRID-NEXT: )
  (func $make-sub-struct (result (ref $sub-struct))
    (unreachable)
  )

  ;; HYBRID:      (func $make-super-array (type $none_=>_ref|$super-array|) (result (ref $super-array))
  ;; HYBRID-NEXT:  (call $make-sub-array)
  ;; HYBRID-NEXT: )
  (func $make-super-array (result (ref $super-array))
    (call $make-sub-array)
  )

  ;; HYBRID:      (func $make-sub-array (type $none_=>_ref|$sub-array|) (result (ref $sub-array))
  ;; HYBRID-NEXT:  (unreachable)
  ;; HYBRID-NEXT: )
  (func $make-sub-array (result (ref $sub-array))
    (unreachable)
  )

  ;; HYBRID:      (func $make-super-func (type $none_=>_ref|$super-func|) (result (ref $super-func))
  ;; HYBRID-NEXT:  (call $make-sub-func)
  ;; HYBRID-NEXT: )
  (func $make-super-func (result (ref $super-func))
    (call $make-sub-func)
  )

  ;; HYBRID:      (func $make-sub-func (type $none_=>_ref|$sub-func|) (result (ref $sub-func))
  ;; HYBRID-NEXT:  (unreachable)
  ;; HYBRID-NEXT: )
  (func $make-sub-func (result (ref $sub-func))
    (unreachable)
  )
)

;; NOTE: Assertions have been generated by update_lit_checks.py --all-items and should not be edited.

;; Test that new-style nominal types are parsed correctly.

;; RUN: foreach %s %t wasm-opt -all -S -o - | filecheck %s
;; RUN: foreach %s %t wasm-opt -all --roundtrip -S -o - | filecheck %s

;; void function type
(module
  ;; CHECK:      (type $super (func))
  (type $super (func))

  ;; CHECK:      (type $sub (sub $super (func)))
  (type $sub (func) (extends $super))

  ;; CHECK:      (global $g (ref null $sub) (ref.null nofunc))
  (global $g (ref null $sub) (ref.null nofunc))
)

;; function type with params and results
(module
  ;; CHECK:      (type $super (func (param i32) (result i32)))
  (type $super (func (param i32) (result i32)))

  ;; CHECK:      (type $sub (sub $super (func (param i32) (result i32))))
  (type $sub (func (param i32) (result i32)) (extends $super))

  ;; CHECK:      (global $g (ref null $sub) (ref.null nofunc))
  (global $g (ref null $sub) (ref.null nofunc))
)

;; empty struct type
(module
  ;; CHECK:      (type $super (struct ))
  (type $super (struct))

  ;; CHECK:      (type $sub (sub $super (struct )))
  (type $sub (struct) (extends $super))

  ;; CHECK:      (global $g (ref null $sub) (ref.null none))
  (global $g (ref null $sub) (ref.null none))
)

;; struct type with fields
(module
  ;; CHECK:      (type $super (struct (field i32) (field i64)))
  (type $super (struct (field i32) i64))

  ;; CHECK:      (type $sub (sub $super (struct (field i32) (field i64))))
  (type $sub (struct i32 (field i64)) (extends $super))

  ;; CHECK:      (global $g (ref null $sub) (ref.null none))
  (global $g (ref null $sub) (ref.null none))
)

;; array type
(module
  ;; CHECK:      (type $super (array i8))
  (type $super (array i8))

  ;; CHECK:      (type $sub (sub $super (array i8)))
  (type $sub (array i8) (extends $super))

  ;; CHECK:      (global $g (ref null $sub) (ref.null none))
  (global $g (ref null $sub) (ref.null none))
)

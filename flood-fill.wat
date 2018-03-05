(module
  (import "console" "log" (func $log (param i32 i32)))
  (import "js" "mem" (memory 2304))
  (func (export "floodFill")
    (param $i i32)
    (param $w i32)
    (param $l i32)
    (param $s i32)
    (param $rr i32)
    (param $gg i32)
    (param $bb i32)
    (param $aa i32)
    (param $th i32)

    (local $j i32)
    (local $o i32)
    (local $c i32)
    (local $r i32)
    (local $g i32)
    (local $b i32)
    (local $a i32)
    (local $p i32)
    (local $tp i32)
    (local $lt i32)
    (local $rg i32)
    (local $bt i32)

    (i32.store (call $index (i32.const 0) (get_local $s) (i32.const 5)) (get_local $i)) ;; queue
    (i32.store8 (call $index (get_local $i) (get_local $s) (i32.const 4)) (i32.const 1)) ;; checked
    (block $block (loop $loop
      (set_local $p (i32.load (call $index (i32.mul (get_local $j) (i32.const 4)) (get_local $s) (i32.const 5))))
      (set_local $o (call $offset (get_local $p)))

      (set_local $r (call $get_val (get_local $o) (i32.const 0)))
      (set_local $g (call $get_val (get_local $o) (i32.const 1)))
      (set_local $b (call $get_val (get_local $o) (i32.const 2)))
      (set_local $a (call $get_val (get_local $o) (i32.const 3)))

      (set_local $tp (call $mv_t (get_local $p) (get_local $w) (get_local $l)))
      (set_local $lt (call $mv_l (get_local $p) (get_local $w) (get_local $l)))
      (set_local $rg (call $mv_r (get_local $p) (get_local $w) (get_local $l)))
      (set_local $bt (call $mv_b (get_local $p) (get_local $w) (get_local $l)))

      (block $df_block
        (br_if $df_block (i32.gt_u (call $abs (i32.sub (get_local $rr) (get_local $r))) (get_local $th)))
        (br_if $df_block (i32.gt_u (call $abs (i32.sub (get_local $gg) (get_local $g))) (get_local $th)))
        (br_if $df_block (i32.gt_u (call $abs (i32.sub (get_local $bb) (get_local $b))) (get_local $th)))
        (br_if $df_block (i32.gt_u (call $abs (i32.sub (get_local $aa) (get_local $a))) (get_local $th)))

        (call $set_val (get_local $o) (i32.const 3) (i32.const 0))

        (block $tp_block
          (br_if $tp_block (i32.eq (i32.const -1) (get_local $tp)))
          (br_if $tp_block (i32.eq (i32.load8_u (call $index (get_local $tp) (get_local $s) (i32.const 4))) (i32.const 1)))
          (set_local $c (i32.add (get_local $c) (i32.const 1)))
          (i32.store (call $index (i32.mul (get_local $c) (i32.const 4)) (get_local $s) (i32.const 5)) (get_local $tp)) ;; queue
          (i32.store8 (call $index (get_local $tp) (get_local $s) (i32.const 4)) (i32.const 1)) ;; checked
        )

        (block $lt_block
          (br_if $lt_block (i32.eq (i32.const -1) (get_local $lt)))
          (br_if $lt_block (i32.eq (i32.load8_u (call $index (get_local $lt) (get_local $s) (i32.const 4))) (i32.const 1)))
          (set_local $c (i32.add (get_local $c) (i32.const 1)))
          (i32.store (call $index (i32.mul (get_local $c) (i32.const 4)) (get_local $s) (i32.const 5)) (get_local $lt)) ;; queue
          (i32.store8 (call $index (get_local $lt) (get_local $s) (i32.const 4)) (i32.const 1)) ;; checked
        )

        (block $rg_block
          (br_if $rg_block (i32.eq (i32.const -1) (get_local $rg)))
          (br_if $rg_block (i32.eq (i32.load8_u (call $index (get_local $rg) (get_local $s) (i32.const 4))) (i32.const 1)))
          (set_local $c (i32.add (get_local $c) (i32.const 1)))
          (i32.store (call $index (i32.mul (get_local $c) (i32.const 4)) (get_local $s) (i32.const 5)) (get_local $rg)) ;; queue
          (i32.store8 (call $index (get_local $rg) (get_local $s) (i32.const 4)) (i32.const 1)) ;; checked
        )

        (block $bt_block
          (br_if $bt_block (i32.eq (i32.const -1) (get_local $bt)))
          (br_if $bt_block (i32.eq (i32.load8_u (call $index (get_local $bt) (get_local $s) (i32.const 4))) (i32.const 1)))
          (set_local $c (i32.add (get_local $c) (i32.const 1)))
          (i32.store (call $index (i32.mul (get_local $c) (i32.const 4)) (get_local $s) (i32.const 5)) (get_local $bt)) ;; queue
          (i32.store8 (call $index (get_local $bt) (get_local $s) (i32.const 4)) (i32.const 1)) ;; checked
        )
      )

      (set_local $j (i32.add (get_local $j) (i32.const 1)))
      (br_if $block (i32.gt_u (get_local $j) (get_local $c)))
      (br $loop)
    ))
  )
  (func $index (param $i i32) (param $s i32) (param $n i32) (result i32)
    (return (i32.add (get_local $i) (i32.mul (get_local $s) (get_local $n))))
  )
  (func $mv_t (param $i i32) (param $w i32) (param $l i32) (result i32)
    (if (i32.ge_s (get_local $i) (get_local $w))
      (then (return (i32.sub (get_local $i) (get_local $w))))
    )
    (return (i32.const -1))
  )
  (func $mv_l (param $i i32) (param $w i32) (param $l i32) (result i32)
    (if (i32.gt_s (i32.sub (get_local $i) (i32.mul (get_local $w) (i32.div_u (get_local $i) (get_local $w))) (i32.const 0)))
      (then (return (i32.sub (get_local $i) (i32.const 1))))
    )
    (return (i32.const -1))
  )
  (func $mv_r (param $i i32) (param $w i32) (param $l i32) (result i32)
    (if (i32.lt_u (call $mod (get_local $i) (get_local $w)) (i32.sub (get_local $w) (i32.const 1)))
      (then (return (i32.add (get_local $i) (i32.const 1))))
    )
    (return (i32.const -1))
  )
  (func $mv_b (param $i i32) (param $w i32) (param $l i32) (result i32)
    (if (i32.lt_s (i32.add (get_local $i) (get_local $w)) (get_local $l))
      (then (return (i32.add (get_local $i) (get_local $w))))
    )
    (return (i32.const -1))
  )
  (func $offset (param $i i32) (result i32)
    (return (i32.add (i32.mul (get_local $i) (i32.const 4)) (i32.const 0)))
  )
  (func $get_val (param $o i32) (param $n i32) (result i32)
    (return (i32.load8_u (i32.add (get_local $o) (get_local $n))))
  )
  (func $set_val (param $o i32) (param $n i32) (param $v i32)
    (return (i32.store8 (i32.add (get_local $o) (get_local $n)) (get_local $v)))
  )
  (func $abs (param $n i32) (result i32)
    (return (i32.sub(i32.xor (get_local $n) (i32.shr_s (get_local $n) (i32.const 31))) (i32.shr_s (get_local $n) (i32.const 31))))
  )
  (func $mod (param $a i32) (param $b i32) (result i32)
    (return (i32.sub (get_local $a) (i32.mul (get_local $b) (i32.div_u (get_local $a) (get_local $b)))))
  )
)
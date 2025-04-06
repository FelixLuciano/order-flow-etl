module Report = struct
  type t = {
    order_id :    int;
    total_amount: float;
    total_taxes:  float;
}

  let columns = ["order_id"; "total_amount"; "total_taxes"]

  let create order_id total_amount total_taxes =
    { order_id=order_id; total_amount=total_amount; total_taxes=total_taxes }
  ;;

  let constructor (vec : string list) =
    match vec with
    | [order_id; total_amount; total_taxes] -> create (int_of_string order_id) (float_of_string total_amount) (float_of_string total_taxes)
    | _ -> failwith "Invalid constructor"
  ;;

  let dump o =
    [string_of_int o.order_id; string_of_float o.total_amount; string_of_float o.total_taxes]
  ;;

  let print o =
    match (dump o) with
    | [a; b; c] -> Printf.printf "order_id:\t%s\ntotal_amount:\t%s\ntotal_taxes\t%s\n" a b c
    | _ -> ()
  ;;

end ;;

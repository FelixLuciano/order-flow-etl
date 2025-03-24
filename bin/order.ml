module Order = struct
  type status =
    | Pending
    | Complete
    | Cancelled

  type origin =
    | Online
    | Physical

  type t = {
    id :         int;
    client_id :  int;
    order_date : string;
    status :     status;
    origin :     origin;
  }

  let columns = ["id"; "client_id"; "order_date"; "status"; "origin"]

  let string_of_orderStatus = function
    | Pending   -> "Pending"
    | Complete  -> "Complete"
    | Cancelled -> "Cancelled"

  let orderStatus_of_string = function
    | "Pending"   -> Pending  
    | "Complete"  -> Complete 
    | "Cancelled" -> Cancelled
    | _ -> failwith "Invalid Order Status"

  let string_of_orderOrigin = function
    | Online    -> "O"
    | Physical  -> "P"

  let orderOrigin_of_string = function
    | "O" -> Online
    | "P" -> Physical
    | _ -> failwith "Invalid Order Origin"

  let create id client_id order_date status origin =
    let status = orderStatus_of_string status in
    let origin = orderOrigin_of_string origin in
    { id=id; client_id=client_id; order_date=order_date; status=status; origin=origin }
  ;;

  let constructor (vec : string list) =
    match vec with
    | [id; client_id; order_date; status; origin] -> create (int_of_string id) (int_of_string client_id) order_date status origin
    | _ -> failwith "Invalid constructor"
  ;;

  let dump o =
    [string_of_int o.id; string_of_int o.client_id; o.order_date; string_of_orderStatus o.status; string_of_orderOrigin o.origin]
  ;;

  let print o =
    match (dump o) with
    | [a; b; c; d; e] -> Printf.printf "id:\t%s\nClient:\t%s\nDate:\t%s\nStatus:\t%s\nOrigin:\t%s\n" a b c d e
    | _ -> ()
  ;;

end ;;

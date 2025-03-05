module Order = struct
  type primaryKey = int
  type dateISO = string

  type status =
    | Pending
    | Complete
    | Cancelled

  type origin =
    | Online
    | Physical

  type t = {
    id :         primaryKey;
    order_date : dateISO;
    status :     status;
    origin :     origin;
  }

  let orderStatus_to_string = function
    | Pending   -> "Pending"
    | Complete  -> "Complete"
    | Cancelled -> "Cancelled"

  let orderStatus_from_string = function
    | "pending"   -> Pending  
    | "complete"  -> Complete 
    | "cancelled" -> Cancelled
    | _ -> failwith "Invalid Order Status"

  let orderOrigin_to_string = function
    | Online    -> "Online"
    | Physical  -> "Physical"

  let orderOrigin_from_string = function
    | "O" -> Online
    | "P" -> Physical
    | _ -> failwith "Invalid Order Origin"

  let create id order_date status origin =
    let statuss = orderStatus_from_string status in
    let origins = orderOrigin_from_string origin in
    { id=id; order_date=order_date; status=statuss; origin=origins }
  ;;

  let print o =
    Printf.printf "id:\t%d\nDate:\t%s\nStatus:\t%s\nOrigin:\t%s\n" o.id o.order_date (orderStatus_to_string o.status) (orderOrigin_to_string o.origin)
end ;;

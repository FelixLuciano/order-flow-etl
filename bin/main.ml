open Order
(* open OrderItem *)
open Mainlib.Dataframe

module OrderDataframe = Dataframe(Order) ;;
(* module OrderItemDataframe = Dataframe(OrderItem) ;; *)

let test = OrderDataframe.init ;;

OrderDataframe.push test (0, "04/03/2025", "complete", "O") ;;
OrderDataframe.push test (1, "05/03/2025", "pending", "P") ;;
Order.print (OrderDataframe.tail test 0) ;;
Order.print (OrderDataframe.tail test 1) ;;

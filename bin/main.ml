open Order
(* open OrderItem *)
open Mainlib.Dataframe
open Mainlib.Csvloader

module OrderDataframe = Dataframe(Order) ;;
(* module OrderItemDataframe = Dataframe(OrderItem) ;; *)

let test = OrderDataframe.init () ;;

OrderDataframe.load test (CsvLoader.load "data/order.csv") ;;

Order.print (OrderDataframe.tail test 0) ;;
Order.print (OrderDataframe.tail test 1) ;;
Order.print (OrderDataframe.tail test 2) ;;
Order.print (OrderDataframe.tail test 3) ;;

let reduced = OrderDataframe.reduce (fun curr acc -> acc + curr.id) 0 test ;;

Printf.printf "reduced = %d\n" reduced ;;

OrderDataframe.store test (CsvLoader.store "cocozinho.csv") ;;

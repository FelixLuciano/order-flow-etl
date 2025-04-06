open Order
open OrderItem
open Report
open Mainlib.Dataframe
open Mainlib.Csvloader

module OrderDataFrame = DataFrame(Order) ;;
module OrderItemDataFrame = DataFrame(OrderItem) ;;
module ReportDataFrame = DataFrame(Report) ;;

let buildReport order items =
  let sumPriceAndTaxes orderItems =
    OrderItemDataFrame.reduce (fun curr acc ->
      match acc with
      | price, tax -> price +. curr.price *. float_of_int curr.quantity, tax +. curr.tax *. curr.price *. float_of_int curr.quantity
    ) (0.0, 0.0) orderItems
  in
  let groupByOrderId id aggregate =
    let groups = aggregate (OrderItemDataFrame.filter (fun item -> item.order_id == id) items) in
    match groups with
    | price, tax -> Report.create id price tax in
  let groups = OrderDataFrame.map (fun row -> groupByOrderId row.id sumPriceAndTaxes) order in
  ReportDataFrame.constructor groups
;;

let order = OrderDataFrame.init () ;;
OrderDataFrame.load order (CsvLoader.load "data/order.csv") ;;
(* OrderDataFrame.load order (CsvLoader.load "data/aditional-order.csv") ;; *)
(* OrderDataFrame.load order (CsvLoader.load "data/aditional-order.csv") ;; *)

let orderItems = OrderItemDataFrame.init () ;;
OrderItemDataFrame.load orderItems (CsvLoader.load "data/order_item.csv") ;;
(* OrderItemDataFrame.load orderItems (CsvLoader.load "data/aditional-order_item.csv") ;; *)
(* OrderItemDataFrame.load orderItems (CsvLoader.load "data/aditional-order_item.csv") ;; *)

let report = buildReport order orderItems in
ReportDataFrame.store report (CsvLoader.store "data/report.csv")
;;

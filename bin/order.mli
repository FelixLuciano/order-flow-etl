open Mainlib.Series

module Order : sig
  include Series

  type primaryKey = int
  type dateISO = string
  type status = Pending | Complete | Cancelled
  type origin = Online | Physical
  type t = {
    id :         primaryKey;
    order_date : dateISO;
    status :     status;
    origin :     origin;
  }
  val orderStatus_to_string : status -> string
  val orderStatus_from_string : string -> status
  val orderOrigin_to_string : origin -> string
  val orderOrigin_from_string : string -> origin
  val create : int -> string -> string -> string -> t
  val print : t -> unit
end ;;

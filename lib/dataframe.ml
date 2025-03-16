open Series

module Dataframe (S : Series) = struct
  type t = { mutable data : S.t list}

  let constructor l = 
    { data = l }
  ;;

  let init () = constructor [] ;;

  let append df row =
    df.data <- row :: df.data;
    row
  ;;

  let push df a = append df (S.constructor a)

  let tail df n =
    List.nth df.data n

  let filter f df =
    { data = List.filter f df.data }

  let map f df =
    List.map f df.data

  let reduce f a df =
    List.fold_right f df.data a
end ;;

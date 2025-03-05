open Series

module Dataframe (S : Series) = struct
  type t = { mutable data : S.t list}

  let init = { data = [] } ;;

  let append df row =
    df.data <- row :: df.data
  ;;

  (* let push = append S.create *)

  let tail df n =
    List.nth df.data n
end ;;

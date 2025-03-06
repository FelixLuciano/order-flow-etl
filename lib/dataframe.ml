open Series

module Dataframe (S : Series) = struct
  type t = { mutable data : S.t list}

  let init = { data = [] } ;;

  let append df row =
    df.data <- row :: df.data;
    row
  ;;

  let push df a = append df (S.constructor a)

  let tail df n =
    List.nth df.data n
end ;;

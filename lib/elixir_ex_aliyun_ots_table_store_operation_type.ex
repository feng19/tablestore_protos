# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStore.OperationType) do
  @moduledoc false
  (
    (
      @spec default() :: :PUT
      def(default()) do
        :PUT
      end
    )

    @spec encode(atom) :: integer | atom
    [
      def(encode(:PUT)) do
        1
      end,
      def(encode(:UPDATE)) do
        2
      end,
      def(encode(:DELETE)) do
        3
      end
    ]

    def(encode(x)) do
      x
    end

    @spec decode(integer) :: atom | integer
    [
      def(decode(1)) do
        :PUT
      end,
      def(decode(2)) do
        :UPDATE
      end,
      def(decode(3)) do
        :DELETE
      end
    ]

    def(decode(x)) do
      x
    end

    @spec constants() :: [{integer, atom}]
    def(constants()) do
      [{1, :PUT}, {2, :UPDATE}, {3, :DELETE}]
    end
  )
end
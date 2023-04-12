# credo:disable-for-this-file
defmodule ExAliyunOts.TableStoreSearch.GroupByHistogramResult do
  @moduledoc false
  defstruct group_by_histogra_items: []

  (
    (
      @spec encode(struct) :: {:ok, iodata} | {:error, any}
      def encode(msg) do
        try do
          {:ok, encode!(msg)}
        rescue
          e in [Protox.EncodingError, Protox.RequiredFieldsError] -> {:error, e}
        end
      end

      @spec encode!(struct) :: iodata | no_return
      def encode!(msg) do
        [] |> encode_group_by_histogra_items(msg)
      end
    )

    []

    [
      defp encode_group_by_histogra_items(acc, msg) do
        try do
          case msg.group_by_histogra_items do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "\n", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:group_by_histogra_items, "invalid field value"),
                    __STACKTRACE__
        end
      end
    ]

    []
  )

  (
    (
      @spec decode(binary) :: {:ok, struct} | {:error, any}
      def decode(bytes) do
        try do
          {:ok, decode!(bytes)}
        rescue
          e in [Protox.DecodingError, Protox.IllegalTagError, Protox.RequiredFieldsError] ->
            {:error, e}
        end
      end

      (
        @spec decode!(binary) :: struct | no_return
        def decode!(bytes) do
          parse_key_value(bytes, struct(ExAliyunOts.TableStoreSearch.GroupByHistogramResult))
        end
      )
    )

    (
      @spec parse_key_value(binary, struct) :: struct
      defp parse_key_value(<<>>, msg) do
        msg
      end

      defp parse_key_value(bytes, msg) do
        {field, rest} =
          case Protox.Decode.parse_key(bytes) do
            {0, _, _} ->
              raise %Protox.IllegalTagError{}

            {1, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 group_by_histogra_items:
                   msg.group_by_histogra_items ++
                     [ExAliyunOts.TableStoreSearch.GroupByHistogramItem.decode!(delimited)]
               ], rest}

            {tag, wire_type, rest} ->
              {_, rest} = Protox.Decode.parse_unknown(tag, wire_type, rest)
              {[], rest}
          end

        msg_updated = struct(msg, field)
        parse_key_value(rest, msg_updated)
      end
    )

    []
  )

  (
    @spec json_decode(iodata(), keyword()) :: {:ok, struct()} | {:error, any()}
    def json_decode(input, opts \\ []) do
      try do
        {:ok, json_decode!(input, opts)}
      rescue
        e in Protox.JsonDecodingError -> {:error, e}
      end
    end

    @spec json_decode!(iodata(), keyword()) :: struct() | no_return()
    def json_decode!(input, opts \\ []) do
      {json_library_wrapper, json_library} = Protox.JsonLibrary.get_library(opts, :decode)

      Protox.JsonDecode.decode!(
        input,
        ExAliyunOts.TableStoreSearch.GroupByHistogramResult,
        &json_library_wrapper.decode!(json_library, &1)
      )
    end

    @spec json_encode(struct(), keyword()) :: {:ok, iodata()} | {:error, any()}
    def json_encode(msg, opts \\ []) do
      try do
        {:ok, json_encode!(msg, opts)}
      rescue
        e in Protox.JsonEncodingError -> {:error, e}
      end
    end

    @spec json_encode!(struct(), keyword()) :: iodata() | no_return()
    def json_encode!(msg, opts \\ []) do
      {json_library_wrapper, json_library} = Protox.JsonLibrary.get_library(opts, :encode)
      Protox.JsonEncode.encode!(msg, &json_library_wrapper.encode!(json_library, &1))
    end
  )

  (
    @deprecated "Use fields_defs()/0 instead"
    @spec defs() :: %{
            required(non_neg_integer) => {atom, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs() do
      %{
        1 =>
          {:group_by_histogra_items, :unpacked,
           {:message, ExAliyunOts.TableStoreSearch.GroupByHistogramItem}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        group_by_histogra_items:
          {1, :unpacked, {:message, ExAliyunOts.TableStoreSearch.GroupByHistogramItem}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "groupByHistograItems",
          kind: :unpacked,
          label: :repeated,
          name: :group_by_histogra_items,
          tag: 1,
          type: {:message, ExAliyunOts.TableStoreSearch.GroupByHistogramItem}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:group_by_histogra_items) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "groupByHistograItems",
             kind: :unpacked,
             label: :repeated,
             name: :group_by_histogra_items,
             tag: 1,
             type: {:message, ExAliyunOts.TableStoreSearch.GroupByHistogramItem}
           }}
        end

        def field_def("groupByHistograItems") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "groupByHistograItems",
             kind: :unpacked,
             label: :repeated,
             name: :group_by_histogra_items,
             tag: 1,
             type: {:message, ExAliyunOts.TableStoreSearch.GroupByHistogramItem}
           }}
        end

        def field_def("group_by_histogra_items") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "groupByHistograItems",
             kind: :unpacked,
             label: :repeated,
             name: :group_by_histogra_items,
             tag: 1,
             type: {:message, ExAliyunOts.TableStoreSearch.GroupByHistogramItem}
           }}
        end
      ),
      def field_def(_) do
        {:error, :no_such_field}
      end
    ]
  )

  []

  (
    @spec required_fields() :: []
    def required_fields() do
      []
    end
  )

  (
    @spec syntax() :: atom()
    def syntax() do
      :proto2
    end
  )

  [
    @spec(default(atom) :: {:ok, boolean | integer | String.t() | float} | {:error, atom}),
    def default(:group_by_histogra_items) do
      {:error, :no_default_value}
    end,
    def default(_) do
      {:error, :no_such_field}
    end
  ]

  (
    @spec file_options() :: nil
    def file_options() do
      nil
    end
  )
end
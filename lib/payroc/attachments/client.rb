# frozen_string_literal: true

module Payroc
  module Attachments
    class Client
      # @param client [Payroc::Internal::Http::RawClient]
      # @param base_url [String, nil]
      # @param environment [Hash[Symbol, String], nil]
      #
      # @return [void]
      def initialize(client:, base_url: nil, environment: nil)
        @client = client
        @base_url = base_url
        @environment = environment
      end

      # > Before you upload an attachment, make sure that you follow local privacy regulations and get the merchant's
      # consent to process their information.
      #
      # **Note:** You need the ID of the processing account before you can upload an attachment. If you don't know the
      # processingAccountId, go to the [Retrieve a Merchant
      # Platform](https://docs.payroc.com/api/schema/boarding/merchant-platforms/retrieve) method.
      #
      # The attachment must be an uncompressed file under 30MB in one of the following formats:
      # - .bmp, csv, .doc, .docx, .gif, .htm, .html, .jpg, .jpeg, .msg, .pdf, .png, .ppt, .pptx, .tif, .tiff, .txt,
      # .xls, .xlsx
      #
      # In the request, include the attachment that you want to upload and the following information about the
      # attachment:
      # - **type** - Type of attachment that you want to upload.
      # - **description** - Short description of the attachment.
      #
      # In the response, our gateway returns information about the attachment including its upload status and an
      # attachmentId that you can use to [Retrieve the details of the
      # Attachment](https://docs.payroc.com/api/schema/attachments/get-attachment).
      #
      # @param request_options [Hash]
      # @param params [void]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :processing_account_id
      # @option params [String] :idempotency_key
      #
      # @return [Payroc::Attachments::Types::Attachment]
      def upload_to_processing_account(request_options: {}, **params)
        params = Payroc::Internal::Types::Utils.normalize_keys(params)
        body = Internal::Multipart::FormData.new

        if params[:attachment]
          body.add(
            name: "attachment",
            value: params[:attachment]
          )
        end
        body.add_part(params[:file].to_form_data_part(name: "file")) if params[:file]

        request = Payroc::Internal::Multipart::Request.new(
          base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
          method: "POST",
          path: "processing-accounts/#{params[:processing_account_id]}/attachments",
          body: body,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Payroc::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Payroc::Attachments::Types::Attachment.load(response.body)
        else
          error_class = Payroc::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Use this method to retrieve the details of an attachment.
      #
      # To retrieve the details of an attachment you need its attachmentId. Our gateway returned the attachmentId in the
      # response of the method that you used to upload the attachment.
      #
      # Our gateway returns information about the attachment, including its upload status and the entity that the
      # attachment is linked to. Our gateway doesn't return the file that you uploaded.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :attachment_id
      #
      # @return [Payroc::Attachments::Types::Attachment]
      def get_attachment(request_options: {}, **params)
        params = Payroc::Internal::Types::Utils.normalize_keys(params)
        request = Payroc::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
          method: "GET",
          path: "attachments/#{params[:attachment_id]}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Payroc::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Payroc::Attachments::Types::Attachment.load(response.body)
        else
          error_class = Payroc::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end

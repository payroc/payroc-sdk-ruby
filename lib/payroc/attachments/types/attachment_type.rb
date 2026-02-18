# frozen_string_literal: true

module Payroc
  module Attachments
    module Types
      module AttachmentType
        extend Payroc::Internal::Types::Enum

        BANKING_EVIDENCE = "bankingEvidence"
        QUESTIONNAIRES_AND_LICENSES = "questionnairesAndLicenses"
        MERCHANT_STATEMENTS = "merchantStatements"
        TAX_DOCUMENTS = "taxDocuments"
        MPA_OR_AMENDMENT = "mpaOrAmendment"
        PROOF_OF_BUSINESS = "proofOfBusiness"
        FINANCIAL_STATEMENTS = "financialStatements"
        PERSONAL_IDENTIFICATION = "personalIdentification"
        OTHER = "other"
      end
    end
  end
end

# Reference
## Payment links
<details><summary><code>client.payment_links.<a href="/lib/payroc/payment_links/client.rb">list</a>(processing_terminal_id) -> Payroc::Types::PaymentLinkPaginatedList</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to return a [paginated](https://docs.payroc.com/api/pagination) list of payment links linked to a processing terminal.  

**Note:** If you want to view the details of a specific payment link and you have its paymentLinkId, use our [Retrieve Payment Link](https://docs.payroc.com/api/schema/payment-links/retrieve) method.  

Use query parameters to filter the list of results that we return, for example, to search for only active links or multi-use links.  

Our gateway returns the following information about each payment link in the list:  
- **type** - Indicates whether the link can be used only once or if it can be used multiple times.  
- **authType** - Indicates whether the transaction is a sale or a pre-authorization.  
- **paymentMethods** - Indicates the payment method that the merchant accepts.  
- **charge** - Indicates whether the merchant or the customer enters the amount for the transaction.  
- **status** - Indicates if the payment link is active.  

For each payment link, we also return a paymentLinkId, which you can use for follow-on actions. 
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.payment_links.list(
  processing_terminal_id: '1234001',
  merchant_reference: 'LinkRef6543',
  link_type: 'multiUse',
  charge_type: 'preset',
  status: 'active',
  recipient_name: 'Sarah Hazel Hopper',
  recipient_email: 'sarah.hopper@example.com',
  created_on: '2024-07-02',
  expires_on: '2024-08-02',
  before: '2571',
  after: '8516',
  limit: 1
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**processing_terminal_id:** `String` — Unique identifier that we assigned to the terminal.
    
</dd>
</dl>

<dl>
<dd>

**merchant_reference:** `String` — Filter results by the unique identifier that the merchant assigned to the payment link.
    
</dd>
</dl>

<dl>
<dd>

**link_type:** `Payroc::PaymentLinks::Types::ListPaymentLinksRequestLinkType` — Filter results by the type of link. Send a value of <code>singleUse</code> or <code>multiUse</code>.
    
</dd>
</dl>

<dl>
<dd>

**charge_type:** `Payroc::PaymentLinks::Types::ListPaymentLinksRequestChargeType` 

Filter results by the user that entered the amount. Send one of the following values:
- <code>prompt</code> - Customer entered the amount.
- <code>preset</code> - Merchant entered the amount.
    
</dd>
</dl>

<dl>
<dd>

**status:** `Payroc::PaymentLinks::Types::ListPaymentLinksRequestStatus` — Filter results by the status of the payment link. Send a value of <code>active</code>, <code>completed</code>,<code>deactived</code>, or <code>expired</code>.
    
</dd>
</dl>

<dl>
<dd>

**recipient_name:** `String` — Filter results by the customer's name.
    
</dd>
</dl>

<dl>
<dd>

**recipient_email:** `String` — Filter results by the customer's email address.
    
</dd>
</dl>

<dl>
<dd>

**created_on:** `String` — Filter results by the link's created date. Send a value in **YYYY-MM-DD** format.
    
</dd>
</dl>

<dl>
<dd>

**expires_on:** `String` — Filter results by the link's expiry date. Send a value in **YYYY-MM-DD** format.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String` 

Return the previous page of results before the value that you specify.  

You can’t send the before parameter in the same request as the after parameter. 
    
</dd>
</dl>

<dl>
<dd>

**after:** `String` 

Return the next page of results after the value that you specify.  

You can’t send the after parameter in the same request as the before parameter. 
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` — Limit the maximum number of results that we return for each page.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::PaymentLinks::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.payment_links.<a href="/lib/payroc/payment_links/client.rb">create</a>(processing_terminal_id, request) -> Payroc::PaymentLinks::Types::CreatePaymentLinksResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to create a payment link that a customer can use to make a payment for goods or services.  

The request includes the following settings:
- **type** - Indicates whether the link can be used only once or if it can be used multiple times.
- **authType** - Indicates whether the transaction is a sale or a pre-authorization.
- **paymentMethod** - Indicates the payment methods that the merchant accepts.
- **charge** - Indicates whether the merchant or the customer enters the amount for the transaction.  

If your request is successful, our gateway returns a paymentLinkId, which you can use to perform follow-on actions.  

**Note:** To share the payment link with a customer, use our [Share Payment Link](https://docs.payroc.com/api/schema/payment-links/sharing-events/share) method.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.payment_links.create(
  processing_terminal_id: '1234001',
  idempotency_key: '8e03978e-40d5-43e8-bc93-6894a57f9324'
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**processing_terminal_id:** `String` — Unique identifier that we assigned to the terminal.
    
</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String` — Unique identifier that you generate for each request. You must use the [UUID v4 format](https://www.rfc-editor.org/rfc/rfc4122) for the identifier. For more information about the idempotency key, go to [Idempotency](https://docs.payroc.com/api/idempotency).
    
</dd>
</dl>

<dl>
<dd>

**request:** `Payroc::PaymentLinks::Types::CreatePaymentLinksRequestBody` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::PaymentLinks::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.payment_links.<a href="/lib/payroc/payment_links/client.rb">retrieve</a>(payment_link_id) -> Payroc::PaymentLinks::Types::RetrievePaymentLinksResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to retrieve information about a payment link.  

To retrieve a payment link, you need its paymentLinkId. Our gateway returned the paymentLinkId in the response of the [Create Payment Link](https://docs.payroc.com/api/schema/payment-links/create) method.  

**Note:** If you don't have the paymentLinkId, use our [List Payment Links](https://docs.payroc.com/api/schema/payment-links/list) method to search for the payment link.  

Our gateway returns the following information about the payment link:  
- **type** - Indicates whether the link can be used only once or if it can be used multiple times.  
- **authType** - Indicates whether the transaction is a sale or a pre-authorization.  
- **paymentMethods** - Indicates the payment method that the merchant accepts.  
- **charge** - Indicates whether the merchant or the customer enters the amount for the transaction.
- **status** - Indicates if the payment link is active.  
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.payment_links.retrieve(payment_link_id: 'JZURRJBUPS');
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**payment_link_id:** `String` — Unique identifier that we assigned to the payment link.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::PaymentLinks::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.payment_links.<a href="/lib/payroc/payment_links/client.rb">partially_update</a>(payment_link_id, request) -> Payroc::PaymentLinks::Types::PartiallyUpdatePaymentLinksResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to partially update a payment link. Structure your request to follow the [RFC 6902](https://datatracker.ietf.org/doc/html/rfc6902) standard.

To update a payment link, you need its paymentLinkId, which we sent you in the response of the [Create Payment Link](https://docs.payroc.com/api/schema/payment-links/create) method.  

**Note:** If you don't have the paymentLinkId, use our [List Payment Links](https://docs.payroc.com/api/schema/payment-links/list) method to search for the payment link.  

You can update the following properties of a multi-use link:
- **expiresOn parameter** - Expiration date of the link.
- **customLabels object** - Label for the payment button.
- **credentialOnFile object** - Settings for saving the customer's payment details.

You can update the following properties of a single-use link:
- **expiresOn parameter** - Expiration date of the link.
- **authType parameter** - Transaction type of the payment link.
- **amount parameter** - Total amount of the transaction.
- **currency parameter** - Currency of the transaction.
- **description parameter** - Brief description of the transaction.
- **customLabels object** - Label for the payment button.
- **credentialOnFile object** - Settings for saving the customer's payment details.

**Note:** When a merchant updates a single-use link, we update the payment URL and HTML code in the assets object. The customer can't use the original link to make a payment.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.payment_links.partially_update(
  payment_link_id: 'JZURRJBUPS',
  idempotency_key: '8e03978e-40d5-43e8-bc93-6894a57f9324',
  request: []
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**payment_link_id:** `String` — Unique identifier that we assigned to the payment link.
    
</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String` — Unique identifier that you generate for each request. You must use the [UUID v4 format](https://www.rfc-editor.org/rfc/rfc4122) for the identifier. For more information about the idempotency key, go to [Idempotency](https://docs.payroc.com/api/idempotency).
    
</dd>
</dl>

<dl>
<dd>

**request:** `Internal::Types::Array[Payroc::Types::PatchDocument]` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::PaymentLinks::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.payment_links.<a href="/lib/payroc/payment_links/client.rb">deactivate</a>(payment_link_id) -> Payroc::PaymentLinks::Types::DeactivatePaymentLinksResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to deactivate a payment link.  

To deactivate a payment link, you need its paymentLinkId. Our gateway returned the paymentLinkId in the response of the [Create Payment Link](https://docs.payroc.com/api/schema/payment-links/create) method.  

**Note:** If you don't have the paymentLinkId, use our [List Payment Links](https://docs.payroc.com/api/schema/payment-links/list) method to search for the payment link.  

If your request is successful, our gateway deactivates the payment link. The customer can't use the link to make a payment, and you can't reactivate the payment link.    
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.payment_links.deactivate(payment_link_id: 'JZURRJBUPS');
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**payment_link_id:** `String` — Unique identifier that we assigned to the payment link.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::PaymentLinks::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Hosted Fields
<details><summary><code>client.hosted_fields.<a href="/lib/payroc/hosted_fields/client.rb">create</a>(processing_terminal_id, request) -> Payroc::Types::HostedFieldsCreateSessionResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to create a Hosted Fields session token. You need to generate a new session token each time you load Hosted Fields on a webpage.  

In your request, you need to indicate whether the merchant is using Hosted Fields to run a sale, save payment details, or update saved payment details.  

In the response, our gateway returns the session token and the time that it expires. You need the session token when you configure the JavaScript for Hosted Fields.  

For more information about adding Hosted Fields to a webpage, go to [Hosted Fields](https://docs.payroc.com/guides/take-payments/hosted-fields). 
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.hosted_fields.create(
  processing_terminal_id: '1234001',
  idempotency_key: '8e03978e-40d5-43e8-bc93-6894a57f9324',
  lib_version: '1.1.0.123456',
  scenario: 'payment'
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**processing_terminal_id:** `String` — Unique identifier that we assigned to the terminal.
    
</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String` — Unique identifier that you generate for each request. You must use the [UUID v4 format](https://www.rfc-editor.org/rfc/rfc4122) for the identifier. For more information about the idempotency key, go to [Idempotency](https://docs.payroc.com/api/idempotency).
    
</dd>
</dl>

<dl>
<dd>

**lib_version:** `String` 

Version of the Hosted Fields JavaScript library that you are using.  

The current production version is `1.6.0.172441`.
    
</dd>
</dl>

<dl>
<dd>

**scenario:** `Payroc::HostedFields::Types::HostedFieldsCreateSessionRequestScenario` 

Indicates if a merchant wants to take a payment or tokenize a customer's payment details:  

- `payment` - The merchant wants to run a sale or run a sale and tokenize in the same transaction.  
- `tokenization` - The merchant wants to save the customer's payment details to take a payment later or to update a customer's payment details that they've already saved.  
    
</dd>
</dl>

<dl>
<dd>

**secure_token_id:** `String` 

Unique identifier that represents a customer's payment details.  

If a merchant wants to update a customer's payment details that are linked to a secure token, include the secureTokenId in your request.  
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::HostedFields::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## ApplePaySessions
<details><summary><code>client.apple_pay_sessions.<a href="/lib/payroc/apple_pay_sessions/client.rb">create</a>(processing_terminal_id, request) -> Payroc::Types::ApplePayResponseSession</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to start an Apple Pay session for your merchant.  

In the response, we return the startSessionObject that you send to Apple when you retrieve the cardholder's encrypted payment details.  

**Note:** For more information about how to integrate with Apple Pay, go to [Apple Pay](https://docs.payroc.com/guides/take-payments/apple-pay).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.apple_pay_sessions.create(
  processing_terminal_id: '1234001',
  apple_domain_id: 'DUHDZJHGYY',
  apple_validation_url: 'https://apple-pay-gateway.apple.com/paymentservices/startSession'
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**processing_terminal_id:** `String` — Unique identifier that we assigned to the terminal.
    
</dd>
</dl>

<dl>
<dd>

**apple_domain_id:** `String` — Unique appleDomainId of the merchant's domain that we assigned when you added their domain to our Self-Care Portal.
    
</dd>
</dl>

<dl>
<dd>

**apple_validation_url:** `String` — Validation URL from the Apple Pay JS API.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::ApplePaySessions::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Attachments
<details><summary><code>client.attachments.<a href="/lib/payroc/attachments/client.rb">upload_to_processing_account</a>(processing_account_id, request) -> Payroc::Attachments::Types::Attachment</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

> Before you upload an attachment, make sure that you follow local privacy regulations and get the merchant's consent to process their information.  

**Note:** You need the ID of the processing account before you can upload an attachment. If you don't know the processingAccountId, go to the [Retrieve a Merchant Platform](https://docs.payroc.com/api/schema/boarding/merchant-platforms/retrieve) method.  

The attachment must be an uncompressed file under 30MB in one of the following formats:
- .bmp, csv, .doc, .docx, .gif, .htm, .html, .jpg, .jpeg, .msg, .pdf, .png, .ppt, .pptx, .tif, .tiff, .txt, .xls, .xlsx  

In the request, include the attachment that you want to upload and the following information about the attachment:
- **type** - Type of attachment that you want to upload.
- **description** - Short description of the attachment.  

In the response, our gateway returns information about the attachment including its upload status and an attachmentId that you can use to [Retrieve the details of the Attachment](https://docs.payroc.com/api/schema/attachments/retrieve).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.attachments.upload_to_processing_account(
  processing_account_id: '38765',
  idempotency_key: '8e03978e-40d5-43e8-bc93-6894a57f9324'
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**processing_account_id:** `String` — Unique identifier that we assigned to the processing account.
    
</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String` — Unique identifier that you generate for each request. You must use the [UUID v4 format](https://www.rfc-editor.org/rfc/rfc4122) for the identifier. For more information about the idempotency key, go to [Idempotency](https://docs.payroc.com/api/idempotency).
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::Attachments::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.attachments.<a href="/lib/payroc/attachments/client.rb">retrieve</a>(attachment_id) -> Payroc::Attachments::Types::Attachment</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to retrieve the details of an attachment.  

To retrieve the details of an attachment you need its attachmentId. Our gateway returned the attachmentId in the response of the method that you used to upload the attachment.  

Our gateway returns information about the attachment, including its upload status and the entity that the attachment is linked to. Our gateway doesn't return the file that you uploaded.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.attachments.retrieve(attachment_id: '12876');
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**attachment_id:** `String` — Unique identifier of the attachment
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::Attachments::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Auth
<details><summary><code>client.auth.<a href="/lib/payroc/auth/client.rb">retrieve_token</a>() -> Payroc::Auth::Types::GetTokenResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Obtain an access token using client credentials
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.auth.retrieve_token(api_key: 'x-api-key');
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**api_key:** `String` — The API key of the application
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::Auth::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## BankTransferPayments Payments
<details><summary><code>client.bank_transfer_payments.payments.<a href="/lib/payroc/bank_transfer_payments/payments/client.rb">list</a>() -> Payroc::Types::BankTransferPaymentPaginatedList</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to return a [paginated](https://docs.payroc.com/api/pagination) list of payments.  

**Note:** If you want to view the details of a specific payment and you have its paymentId, use our [Retrieve Payment](https://docs.payroc.com/api/schema/bank-transfer-payments/payments/retrieve) method.  

Use query parameters to filter the list of results that we return, for example, to search for payments for a customer, a date range, or a settlement state.  

Our gateway returns the following information about each payment in the list:  

- Order details, including the transaction amount and when it was processed.  
- Bank account details, including the customer’s name and account number.  
- Customer's details, including the customer’s phone number.  
- Transaction details, including any refunds or re-presentments.  

For each transaction, we also return the paymentId and an optional secureTokenId, which you can use to perform follow-on actions.  
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.bank_transfer_payments.payments.list(
  processing_terminal_id: '1234001',
  order_id: 'OrderRef6543',
  name_on_account: 'Sarah%20Hazel%20Hopper',
  last_4: '7890',
  date_from: '2024-07-01T00:00:00Z',
  date_to: '2024-07-31T23:59:59Z',
  settlement_state: 'settled',
  settlement_date: '2024-07-15',
  payment_link_id: 'JZURRJBUPS',
  before: '2571',
  after: '8516',
  limit: 1
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**processing_terminal_id:** `String` — Filter results by the unique identifier that we assigned to the terminal.
    
</dd>
</dl>

<dl>
<dd>

**order_id:** `String` — Filter results by the order ID of the payment.
    
</dd>
</dl>

<dl>
<dd>

**name_on_account:** `String` — Filter results by the account holder's name.
    
</dd>
</dl>

<dl>
<dd>

**last_4:** `String` — Filter results by the last four digits of the account number.
    
</dd>
</dl>

<dl>
<dd>

**type:** `Payroc::BankTransferPayments::Payments::Types::ListPaymentsRequestTypeItem` — Filter results by transaction type.
    
</dd>
</dl>

<dl>
<dd>

**status:** `Payroc::BankTransferPayments::Payments::Types::ListPaymentsRequestStatusItem` — Filter results by the status of the payment.
    
</dd>
</dl>

<dl>
<dd>

**date_from:** `String` — Filter results by payments that the merchant ran after a specific date. The value follows the [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) standard.
    
</dd>
</dl>

<dl>
<dd>

**date_to:** `String` — Filter results by payments that the merchant ran before a specific date. The value follows the [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) standard.
    
</dd>
</dl>

<dl>
<dd>

**settlement_state:** `Payroc::BankTransferPayments::Payments::Types::ListPaymentsRequestSettlementState` — Filter results by the settlement status.
    
</dd>
</dl>

<dl>
<dd>

**settlement_date:** `String` — Filter results by the settlement date. Send a value in **YYYY-MM-DD** format.
    
</dd>
</dl>

<dl>
<dd>

**payment_link_id:** `String` — Filter results by the paymentLinkId.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String` 

Return the previous page of results before the value that you specify.  

You can’t send the before parameter in the same request as the after parameter. 
    
</dd>
</dl>

<dl>
<dd>

**after:** `String` 

Return the next page of results after the value that you specify.  

You can’t send the after parameter in the same request as the before parameter. 
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` — Limit the maximum number of results that we return for each page.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::BankTransferPayments::Payments::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.bank_transfer_payments.payments.<a href="/lib/payroc/bank_transfer_payments/payments/client.rb">create</a>(request) -> Payroc::Types::BankTransferPayment</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to run a sale with a customer's bank account details.  

In the response, our gateway returns information about the bank transfer payment and a paymentId, which you need for the following methods:  
-	[Retrieve payment](https://docs.payroc.com/api/schema/bank-transfer-payments/payments/retrieve) - View the details of the bank transfer payment.
-	[Reverse payment](https://docs.payroc.com/api/schema/bank-transfer-payments/refunds/reverse-payment) - Cancel the bank transfer payment if it's an open batch.
-	[Refund payment](https://docs.payroc.com/api/schema/bank-transfer-payments/refunds/refund) - Run a referenced refund to return funds to the customer's bank account.

**Payment methods**  

Our gateway accepts the following payment methods:  
-	Automated clearing house (ACH) details
-	Pre-authorized debit (PAD) details  

You can also use [secure tokens](https://docs.payroc.com/api/schema/payments/secure-tokens/overview) and [single-use tokens](https://docs.payroc.com/api/schema/tokenization/single-use-tokens/create) that you created from ACH details or PAD details. 
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.bank_transfer_payments.payments.create(
  idempotency_key: '8e03978e-40d5-43e8-bc93-6894a57f9324',
  processing_terminal_id: '1234001',
  order: {
    order_id: 'OrderRef6543',
    description: 'Large Pepperoni Pizza',
    amount: 4999,
    currency: 'USD',
    breakdown: {
      subtotal: 4347,
      tip: {
        type: 'percentage',
        percentage: 10
      },
      taxes: [{
        type: 'rate',
        rate: 5,
        name: 'Sales Tax'
      }]
    }
  },
  customer: {
    notification_language: 'en',
    contact_methods: []
  },
  credential_on_file: {
    tokenize: true
  },
  custom_fields: [{
    name: 'yourCustomField',
    value: 'abc123'
  }]
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**idempotency_key:** `String` — Unique identifier that you generate for each request. You must use the [UUID v4 format](https://www.rfc-editor.org/rfc/rfc4122) for the identifier. For more information about the idempotency key, go to [Idempotency](https://docs.payroc.com/api/idempotency).
    
</dd>
</dl>

<dl>
<dd>

**processing_terminal_id:** `String` — Unique identifier that we assigned to the terminal.
    
</dd>
</dl>

<dl>
<dd>

**order:** `Payroc::Types::BankTransferPaymentRequestOrder` 
    
</dd>
</dl>

<dl>
<dd>

**customer:** `Payroc::Types::BankTransferCustomer` 
    
</dd>
</dl>

<dl>
<dd>

**credential_on_file:** `Payroc::Types::SchemasCredentialOnFile` 
    
</dd>
</dl>

<dl>
<dd>

**payment_method:** `Payroc::BankTransferPayments::Payments::Types::BankTransferPaymentRequestPaymentMethod` 

Polymorphic object that contains payment detail information.  

The value of the type parameter determines which variant you should use:  
-	`ach` - Automated Clearing House (ACH) details
-	`pad` - Pre-authorized debit (PAD) details
-	`secureToken` - Secure token details
-	`singleUseToken` - Single-use token details
    
</dd>
</dl>

<dl>
<dd>

**custom_fields:** `Internal::Types::Array[Payroc::Types::CustomField]` — Array of customField objects.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::BankTransferPayments::Payments::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.bank_transfer_payments.payments.<a href="/lib/payroc/bank_transfer_payments/payments/client.rb">retrieve</a>(payment_id) -> Payroc::Types::BankTransferPayment</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to retrieve information about a bank transfer payment.  

To retrieve a payment, you need its paymentId. Our gateway returned the paymentId in the response of the [Create Payment](https://docs.payroc.com/api/schema/bank-transfer-payments/payments/create) method.  

Note: If you don’t have the paymentId, use our [List Payments](https://docs.payroc.com/api/schema/bank-transfer-payments/payments/list) method to search for the payment.  

Our gateway returns the following information about the payment:  

-	Order details, including the transaction amount and when it was processed.  
-	Bank account details, including the customer’s name and account number.  
-	Customer’s details, including the customer’s phone number.  
-	Transaction details, including any refunds or re-presentments.  

If the merchant saved the customer’s bank account details, our gateway returns a secureTokenID, which you can use to perform follow-on actions.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.bank_transfer_payments.payments.retrieve(payment_id: 'M2MJOG6O2Y');
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**payment_id:** `String` — Unique identifier that our gateway assigned to the payment.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::BankTransferPayments::Payments::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.bank_transfer_payments.payments.<a href="/lib/payroc/bank_transfer_payments/payments/client.rb">represent</a>(payment_id, request) -> Payroc::Types::BankTransferPayment</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to re-present an ACH payment.  

To re-present a payment, you need the paymentId of the return. To get the paymentId of the return, complete the following steps:  

1.	Use our [Retrieve Payment](https://docs.payroc.com/api/schema/bank-transfer-payments/payments/retrieve) method  to view the details of the original payment.  
2.	From the [returns object](https://docs.payroc.com/api/schema/bank-transfer-payments/payments/retrieve#response.body.returns) in the response, get the paymentId of the return.  

Our gateway uses the bank account details from the original payment. If you want to update the customer's bank account details, send the new bank account details in the request.  

If your request is successful, our gateway re-presents the payment.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.bank_transfer_payments.payments.represent(
  payment_id: 'M2MJOG6O2Y',
  idempotency_key: '8e03978e-40d5-43e8-bc93-6894a57f9324'
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**payment_id:** `String` — Unique identifier that our gateway assigned to the payment.
    
</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String` — Unique identifier that you generate for each request. You must use the [UUID v4 format](https://www.rfc-editor.org/rfc/rfc4122) for the identifier. For more information about the idempotency key, go to [Idempotency](https://docs.payroc.com/api/idempotency).
    
</dd>
</dl>

<dl>
<dd>

**payment_method:** `Payroc::BankTransferPayments::Payments::Types::RepresentmentPaymentMethod` 

Polymorphic object that contains the customer's updated payment details.  

The value of the type parameter determines which variant you should use:  
-	`ach` - Automated Clearing House (ACH) details
-	`secureToken` - Secure token details
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::BankTransferPayments::Payments::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## BankTransferPayments Refunds
<details><summary><code>client.bank_transfer_payments.refunds.<a href="/lib/payroc/bank_transfer_payments/refunds/client.rb">reverse_payment</a>(payment_id) -> Payroc::Types::BankTransferPayment</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to cancel a bank transfer payment in an open batch. This is also known as voiding a payment.  

To cancel a bank transfer payment, you need its paymentId. Our gateway returned the paymentId in the response of the [Create Payment](https://docs.payroc.com/api/schema/bank-transfer-payments/payments/create) method.  

**Note:** If you don't have the paymentId, use our [List Payments](https://docs.payroc.com/api/schema/bank-transfer-payments/payments/list) method to search for the bank transfer payment.  

If your request is successful, our gateway removes the bank transfer payment from the merchant’s open batch and no funds are taken from the customer's bank account.  
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.bank_transfer_payments.refunds.reverse_payment(
  payment_id: 'M2MJOG6O2Y',
  idempotency_key: '8e03978e-40d5-43e8-bc93-6894a57f9324'
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**payment_id:** `String` — Unique identifier that our gateway assigned to the payment.
    
</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String` — Unique identifier that you generate for each request. You must use the [UUID v4 format](https://www.rfc-editor.org/rfc/rfc4122) for the identifier. For more information about the idempotency key, go to [Idempotency](https://docs.payroc.com/api/idempotency).
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::BankTransferPayments::Refunds::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.bank_transfer_payments.refunds.<a href="/lib/payroc/bank_transfer_payments/refunds/client.rb">refund</a>(payment_id, request) -> Payroc::Types::BankTransferPayment</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to refund a bank transfer payment that is in a closed batch.  

To refund a bank transfer payment, you need its paymentId. Our gateway returned the paymentId in the response of the [Create Payment](https://docs.payroc.com/api/schema/bank-transfer-payments/payments/create) method.  

**Note:** If you don’t have the paymentId, use our [List Payments](https://docs.payroc.com/api/schema/bank-transfer-payments/payments/list) method to search for the bank transfer payment.  

If your refund is successful, our gateway returns the payment amount to the customer's account.  

**Things to consider**  
- If the merchant refunds a bank transfer payment that is in an open batch, our gateway reverses the bank transfer payment.  
- Some merchants can run unreferenced refunds, which means that they don’t need a paymentId to return an amount to a customer. For more information about how to run an unreferenced refund, go to [Create Refund](https://docs.payroc.com/api/schema/bank-transfer-payments/refunds/create).  
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.bank_transfer_payments.refunds.refund(
  payment_id: 'M2MJOG6O2Y',
  idempotency_key: '8e03978e-40d5-43e8-bc93-6894a57f9324',
  amount: 4999,
  description: 'amount to refund'
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**payment_id:** `String` — Unique identifier that our gateway assigned to the payment.
    
</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String` — Unique identifier that you generate for each request. You must use the [UUID v4 format](https://www.rfc-editor.org/rfc/rfc4122) for the identifier. For more information about the idempotency key, go to [Idempotency](https://docs.payroc.com/api/idempotency).
    
</dd>
</dl>

<dl>
<dd>

**amount:** `Integer` — Total amount of the refund. The value is in the currency's lowest denomination, for example, cents.
    
</dd>
</dl>

<dl>
<dd>

**description:** `String` — Description of the refund.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::BankTransferPayments::Refunds::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.bank_transfer_payments.refunds.<a href="/lib/payroc/bank_transfer_payments/refunds/client.rb">list</a>() -> Payroc::Types::BankTransferRefundPaginatedList</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to return a [paginated](https://docs.payroc.com/api/pagination) list of bank transfer refunds.  

**Note:** If you want to view the details of a specific refund and you have its refundId, use our [Retrieve Refund](https://docs.payroc.com/api/schema/bank-transfer-payments/refunds/retrieve) method.  

Use query parameters to filter the list of results that we return, for example, to search for refunds for a customer, an orderId, or a date range.  

Our gateway returns the following information about each refund in the list:  

-	Order details, including the refund amount and when it was processed.  
-	Bank account details, including the customer’s name and account number.  

For referenced refunds, our gateway also returns details about the payment that the refund is linked to.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.bank_transfer_payments.refunds.list(
  processing_terminal_id: '1234001',
  order_id: 'OrderRef6543',
  name_on_account: 'Sarah%20Hazel%20Hopper',
  last_4: '7062',
  date_from: '2024-07-01T00:00:00Z',
  date_to: '2024-07-31T23:59:59Z',
  settlement_state: 'settled',
  settlement_date: '2024-07-15',
  before: '2571',
  after: '8516',
  limit: 1
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**processing_terminal_id:** `String` — Filter results by the unique identifier that we assigned to the terminal.
    
</dd>
</dl>

<dl>
<dd>

**order_id:** `String` — Filter results by the order ID of the refund.
    
</dd>
</dl>

<dl>
<dd>

**name_on_account:** `String` — Filter results by the accountholder's name.
    
</dd>
</dl>

<dl>
<dd>

**last_4:** `String` — Filter results by the last four digits of the account number.
    
</dd>
</dl>

<dl>
<dd>

**type:** `Payroc::BankTransferPayments::Refunds::Types::ListRefundsRequestTypeItem` — Filter results by transaction type.
    
</dd>
</dl>

<dl>
<dd>

**status:** `Payroc::BankTransferPayments::Refunds::Types::ListRefundsRequestStatusItem` — Filter results by the status of the refund.
    
</dd>
</dl>

<dl>
<dd>

**date_from:** `String` — Filter results by refunds that the merchant ran after a specific date. The value follows the [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) standard.
    
</dd>
</dl>

<dl>
<dd>

**date_to:** `String` — Filter results by refunds that the merchant ran before a specific date. The value follows the [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) standard.
    
</dd>
</dl>

<dl>
<dd>

**settlement_state:** `Payroc::BankTransferPayments::Refunds::Types::ListRefundsRequestSettlementState` — Filter results by the settlement status.
    
</dd>
</dl>

<dl>
<dd>

**settlement_date:** `String` — Filter results by the settlement date. Send a value in **YYYY-MM-DD** format.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String` 

Return the previous page of results before the value that you specify.  

You can’t send the before parameter in the same request as the after parameter. 
    
</dd>
</dl>

<dl>
<dd>

**after:** `String` 

Return the next page of results after the value that you specify.  

You can’t send the after parameter in the same request as the before parameter. 
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` — Limit the maximum number of results that we return for each page.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::BankTransferPayments::Refunds::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.bank_transfer_payments.refunds.<a href="/lib/payroc/bank_transfer_payments/refunds/client.rb">create</a>(request) -> Payroc::Types::BankTransferRefund</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to create an unreferenced refund. An unreferenced refund is a refund that isn’t linked to a bank transfer payment.  

**Note:** If you have the paymentId of the payment you want to refund, use our [Refund Payment](https://docs.payroc.com/api/schema/bank-transfer-payments/refunds/refund) method. If you use our Refund Payment method, our gateway sends the refund amount to the customer’s original payment method and links the refund to the payment.  

In the request, you must provide the customer’s payment method and information about the order including the refund amount.  

In the response, our gateway returns information about the refund and a refundId, which you need for the following methods:  

-	[Retrieve refund](https://docs.payroc.com/api/schema/bank-transfer-payments/refunds/retrieve) – View the details of the refund.  
-	[Reverse refund](https://docs.payroc.com/api/schema/bank-transfer-payments/refunds/reverse-refund) – Cancel the refund if it’s in an open batch.  
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.bank_transfer_payments.refunds.create(
  idempotency_key: '8e03978e-40d5-43e8-bc93-6894a57f9324',
  processing_terminal_id: '1234001',
  order: {
    order_id: 'OrderRef6543',
    description: 'Refund for order OrderRef6543',
    amount: 4999,
    currency: 'USD'
  },
  customer: {
    notification_language: 'en',
    contact_methods: []
  },
  custom_fields: [{
    name: 'yourCustomField',
    value: 'abc123'
  }]
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**idempotency_key:** `String` — Unique identifier that you generate for each request. You must use the [UUID v4 format](https://www.rfc-editor.org/rfc/rfc4122) for the identifier. For more information about the idempotency key, go to [Idempotency](https://docs.payroc.com/api/idempotency).
    
</dd>
</dl>

<dl>
<dd>

**processing_terminal_id:** `String` — Unique identifier that we assigned to the terminal.
    
</dd>
</dl>

<dl>
<dd>

**order:** `Payroc::Types::BankTransferRefundOrder` 
    
</dd>
</dl>

<dl>
<dd>

**customer:** `Payroc::Types::BankTransferCustomer` 
    
</dd>
</dl>

<dl>
<dd>

**refund_method:** `Payroc::BankTransferPayments::Refunds::Types::BankTransferUnreferencedRefundRefundMethod` 

Polymorphic object that contains payment details for the refund.  

The value of the type parameter determines which variant you should use:  
-	`ach` - Automated Clearing House (ACH) details
-	`secureToken` - Secure token details
    
</dd>
</dl>

<dl>
<dd>

**custom_fields:** `Internal::Types::Array[Payroc::Types::CustomField]` — Array of customField objects.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::BankTransferPayments::Refunds::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.bank_transfer_payments.refunds.<a href="/lib/payroc/bank_transfer_payments/refunds/client.rb">retrieve</a>(refund_id) -> Payroc::Types::BankTransferRefund</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to retrieve information about a refund.  

To retrieve a refund, you need its refundId. Our gateway returned the refundId in the response of the [Refund Payment](https://docs.payroc.com/api/schema/bank-transfer-payments/refunds/refund) method or the [Create Refund](https://docs.payroc.com/api/schema/bank-transfer-payments/refunds/create) method.  

**Note:** If you don’t have the refundId, use our [List Refunds](https://docs.payroc.com/api/schema/bank-transfer-payments/refunds/list) method to search for the refund.  

Our gateway returns the following information about the refund:  

- Order details, including the refund amount and when it was processed.  
- Bank account details, including the customer’s name and account number.  

If the refund is a referenced refund, our gateway also returns details about the payment that the refund is linked to.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.bank_transfer_payments.refunds.retrieve(refund_id: 'CD3HN88U9F');
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**refund_id:** `String` — Unique identifier that our gateway assigned to the refund.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::BankTransferPayments::Refunds::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.bank_transfer_payments.refunds.<a href="/lib/payroc/bank_transfer_payments/refunds/client.rb">reverse_refund</a>(refund_id) -> Payroc::Types::BankTransferRefund</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to cancel a bank transfer refund in an open batch.  

To cancel a refund, you need its refundId. Our gateway returned the refundId in the response of the [Refund Payment](https://docs.payroc.com/api/schema/bank-transfer-payments/refunds/refund) or [Create Refund](https://docs.payroc.com/api/schema/bank-transfer-payments/refunds/create) method.  

**Note:** If you don’t have the refundId, use our [List Refunds](https://docs.payroc.com/api/schema/bank-transfer-payments/refunds/list) method to search for the refund.  

If your request is successful, the gateway removes the refund from the merchant’s open batch, and no funds are returned to the cardholder’s account.  
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.bank_transfer_payments.refunds.reverse_refund(
  refund_id: 'CD3HN88U9F',
  idempotency_key: '8e03978e-40d5-43e8-bc93-6894a57f9324'
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**refund_id:** `String` — Unique identifier that our gateway assigned to the refund.
    
</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String` — Unique identifier that you generate for each request. You must use the [UUID v4 format](https://www.rfc-editor.org/rfc/rfc4122) for the identifier. For more information about the idempotency key, go to [Idempotency](https://docs.payroc.com/api/idempotency).
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::BankTransferPayments::Refunds::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Boarding Owners
<details><summary><code>client.boarding.owners.<a href="/lib/payroc/boarding/owners/client.rb">retrieve</a>(owner_id) -> Payroc::Types::Owner</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to retrieve details about an owner of a processing account or an owner associated with a funding recipient.  

To retrieve an owner, you need their ownerId. Our gateway returned the ownerId in the response of the [Create Processing Account](https://docs.payroc.com/api/schema/boarding/merchant-platforms/create-processing-account) method or the [Create Funding Recipient Owner](https://docs.payroc.com/api/schema/funding/funding-recipients/create-owner) method.  

**Note:** If you don't have the ownerId, use the [Retrieve Processing Account](https://docs.payroc.com/api/schema/boarding/processing-accounts/retrieve) method if you are searching for a processing account owner, or use the [List Funding Recipient Owners](https://docs.payroc.com/api/schema/funding/funding-recipients/list-owners) method if you are searching for a funding recipient owner.  

Our gateway returns the following information about an owner:  
- Name, date of birth, and address.  
- Contact details, including their email address.  
- Relationship to the business, including whether they are a control prong or authorized signatory, and their equity stake in the business. 
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.boarding.owners.retrieve(owner_id: 1);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**owner_id:** `Integer` — Unique identifier that we assigned to the owner.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::Boarding::Owners::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.boarding.owners.<a href="/lib/payroc/boarding/owners/client.rb">update</a>(owner_id, request) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

> **Important:** You can't update the details of an owner of a processing account.  

Use this method to update the details of an owner associated with a funding recipient.  

To update an owner, you need their ownerId. Our gateway returned the ownerId in the response of the [Create Funding Recipient](https://docs.payroc.com/api/schema/funding/funding-recipients/create) method and the [Create Funding Recipient Owner](https://docs.payroc.com/api/schema/funding/funding-recipients/create-owner) method.   

**Note:** If you don't have the ownerId, use the [List Funding Recipient Owners](https://docs.payroc.com/api/schema/funding/funding-recipients/list-owners) method, the [Retrieve Funding Recipient](https://docs.payroc.com/api/schema/funding/funding-recipients/retrieve) method, or the [List Funding Recipients](https://docs.payroc.com/api/schema/funding/funding-recipients/list) method to search for the funding recipient owner.  

You can update the following details about an owner:  

- Personal details, including their name, date of birth, and address.  
- Identification details, including their identification type and number.  
- Contact details, including their email address.  
- Relationship to the business, including whether they are a control prong.  
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.boarding.owners.update(
  owner_id: 1,
  first_name: 'Jane',
  middle_name: 'Helen',
  last_name: 'Doe',
  date_of_birth: '1964-03-22',
  address: {
    address_1: '1 Example Ave.',
    address_2: 'Example Address Line 2',
    address_3: 'Example Address Line 3',
    city: 'Chicago',
    state: 'Illinois',
    country: 'US',
    postal_code: '60056'
  },
  identifiers: [{
    type: 'nationalId',
    value: '000-00-4320'
  }],
  contact_methods: [],
  relationship: {
    equity_percentage: 48.5,
    title: 'CFO',
    is_control_prong: true,
    is_authorized_signatory: false
  }
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**owner_id:** `Integer` — Unique identifier that we assigned to the owner.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Payroc::Types::Owner` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::Boarding::Owners::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.boarding.owners.<a href="/lib/payroc/boarding/owners/client.rb">delete</a>(owner_id) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

> **Important:** You can't delete an owner of a processing account. 

Use this method to delete an owner associated with a funding recipient. You can delete an owner only if the funding recipient has more than one owner.  

To delete an owner, you need their ownerId. Our gateway returned the ownerId in the response of the [Create Funding Recipient](https://docs.payroc.com/api/schema/funding/funding-recipients/create) method and the [Create Funding Recipient Owner](https://docs.payroc.com/api/schema/funding/funding-recipients/create-owner) method.  

**Note:** If you don't have the ownerId, use the [List Funding Recipient Owners](https://docs.payroc.com/api/schema/funding/funding-recipients/list-owners) method, the [Retrieve Funding Recipient](https://docs.payroc.com/api/schema/funding/funding-recipients/retrieve) method, or the [List Funding Recipients](https://docs.payroc.com/api/schema/funding/funding-recipients/list) method to search for the funding recipient owner.  
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.boarding.owners.delete(owner_id: 1);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**owner_id:** `Integer` — Unique identifier that we assigned to the owner.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::Boarding::Owners::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Boarding PricingIntents
<details><summary><code>client.boarding.pricing_intents.<a href="/lib/payroc/boarding/pricing_intents/client.rb">list</a>() -> Payroc::Types::PaginatedPricingIntent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to return a [paginated](https://docs.payroc.com/api/pagination) list of pricing intents associated with the ISV.  

**Note:** If you want to view the details of a specific pricing intent and you have its pricingIntentId, use our [Retrieve Pricing Intent](https://docs.payroc.com/api/schema/boarding/pricing-intents/retrieve) method.  

Our gateway returns the following information about each pricing intent in the list:  

- Information about the fees, including the base fees, gateway fees, and processor fees.  
- Status of the pricing intent, including whether we approved the pricing intent.  

For each pricing intent, we also return its pricingIntentId which you can use to perform follow-on actions.  
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.boarding.pricing_intents.list(
  before: '2571',
  after: '8516',
  limit: 1
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**before:** `String` 

Return the previous page of results before the value that you specify.  

You can’t send the before parameter in the same request as the after parameter. 
    
</dd>
</dl>

<dl>
<dd>

**after:** `String` 

Return the next page of results after the value that you specify.  

You can’t send the after parameter in the same request as the before parameter. 
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` — Limit the maximum number of results that we return for each page.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::Boarding::PricingIntents::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.boarding.pricing_intents.<a href="/lib/payroc/boarding/pricing_intents/client.rb">create</a>(request) -> Payroc::Types::PricingIntent50</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to create a pricing intent that you can assign to a processing account.  

In the request, you must provide the following:
-	Processing fees, including the pricing program and the fee to process each transaction.
-	Gateway fees, including the fee for each transaction handled by our gateway.
-	Base fees, including maintenance and PCI fees.

In the response, our gateway returns information about the pricing intent and the pricingIntentId, which you need for the following methods:
-	[Create Merchant Platform](https://docs.payroc.com/api/schema/boarding/merchant-platforms/create) - Assign the pricing intent to a processing account, when you create the merchant platform and its processing accounts.
-	[Create Processing Account](https://docs.payroc.com/api/schema/boarding/merchant-platforms/create-processing-account) - Assign the pricing intent to a processing account.
-	[Retrieve Pricing Intent](https://docs.payroc.com/api/schema/boarding/pricing-intents/retrieve) - Retrieve information about a pricing intent.
-	[Update Pricing Intent](https://docs.payroc.com/api/schema/boarding/pricing-intents/update) - Update the details of a pricing intent. 
-	[Delete Pricing Intent](https://docs.payroc.com/api/schema/boarding/pricing-intents/delete) - Delete a pricing intent.
-	[Partially Update Pricing Intent](https://docs.payroc.com/api/schema/boarding/pricing-intents/partially-update) - Partially update the details of a pricing intent.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.boarding.pricing_intents.create(
  idempotency_key: '8e03978e-40d5-43e8-bc93-6894a57f9324',
  key: 'Your-Unique-Identifier',
  metadata: {
    yourCustomField: 'abc123'
  },
  country: 'US',
  version: '5.0',
  base: {
    address_verification: 5,
    annual_fee: {
      bill_in_month: 'june',
      amount: 9900
    },
    regulatory_assistance_program: 15,
    pci_non_compliance: 4995,
    merchant_advantage: 10,
    maintenance: 500,
    minimum: 100,
    voice_authorization: 95,
    chargeback: 2500,
    retrieval: 1500,
    batch: 1500,
    early_termination: 57500
  },
  processor: {},
  services: []
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**idempotency_key:** `String` — Unique identifier that you generate for each request. You must use the [UUID v4 format](https://www.rfc-editor.org/rfc/rfc4122) for the identifier. For more information about the idempotency key, go to [Idempotency](https://docs.payroc.com/api/idempotency).
    
</dd>
</dl>

<dl>
<dd>

**request:** `Payroc::Types::PricingIntent50` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::Boarding::PricingIntents::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.boarding.pricing_intents.<a href="/lib/payroc/boarding/pricing_intents/client.rb">retrieve</a>(pricing_intent_id) -> Payroc::Types::PricingIntent50</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to retrieve information about a pricing intent.  

To retrieve a pricing intent, you need its pricingIntentId. Our gateway returned the pricingIntentId in the response of the [Create Pricing Intent](https://docs.payroc.com/api/schema/boarding/pricing-intents/create) method.  

**Note:** If you don't have the pricingIntentId, use our [List Pricing Intents](https://docs.payroc.com/api/schema/boarding/pricing-intents/list) method to search for the pricing intent.  

Our gateway returns the following information about the pricing intent:  

- Information about the fees, including the base fees, gateway fees, and processor fees.  
- Status of the pricing intent, including whether we approved the pricing intent.  
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.boarding.pricing_intents.retrieve(pricing_intent_id: '5');
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**pricing_intent_id:** `String` — Unique identifier that we assigned to the pricing intent.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::Boarding::PricingIntents::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.boarding.pricing_intents.<a href="/lib/payroc/boarding/pricing_intents/client.rb">update</a>(pricing_intent_id, request) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to update the details of a pricing intent. If you update a pricing intent, it won't affect merchant that you've previously onboarded.  

To update a pricing intent, you need its pricingIntentId. Our gateway returned the pricingIntentId in the response of the [Create Pricing Intent](https://docs.payroc.com/api/schema/boarding/pricing-intents/create) method.  

**Note:** If you don't have the pricingIntentId, use our [List Pricing Intents](https://docs.payroc.com/api/schema/boarding/pricing-intents/list) method to search for the pricing intent.  

You can update the following details about a pricing intent:  

- Fees, including the base fees, processor fees, and gateway fees.  
- Custom name for the pricing intent.  
- Additional services that merchants can sign up for.  
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.boarding.pricing_intents.update(
  pricing_intent_id: '5',
  key: 'Your-Unique-Identifier',
  metadata: {
    yourCustomField: 'abc123'
  },
  country: 'US',
  version: '5.0',
  base: {
    address_verification: 5,
    annual_fee: {
      bill_in_month: 'june',
      amount: 9900
    },
    regulatory_assistance_program: 15,
    pci_non_compliance: 4995,
    merchant_advantage: 10,
    maintenance: 500,
    minimum: 100,
    voice_authorization: 95,
    chargeback: 2500,
    retrieval: 1500,
    batch: 1500,
    early_termination: 57500
  },
  processor: {
    ach: {
      fees: {
        transaction: 50,
        batch: 5,
        returns: 400,
        unauthorized_return: 1999,
        statement: 800,
        monthly_minimum: 20000,
        account_verification: 10,
        discount_rate_under_10000: 5.25,
        discount_rate_above_10000: 10
      }
    }
  },
  gateway: {
    fees: {
      monthly: 2000,
      setup: 5000,
      per_transaction: 2000,
      per_device_monthly: 10
    }
  },
  services: []
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**pricing_intent_id:** `String` — Unique identifier that we assigned to the pricing intent.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Payroc::Types::PricingIntent50` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::Boarding::PricingIntents::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.boarding.pricing_intents.<a href="/lib/payroc/boarding/pricing_intents/client.rb">delete</a>(pricing_intent_id) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to delete a pricing intent.  

> **Important:** When you delete a pricing intent, you can't recover it. You also won't be able to assign the pricing intent to a merchant's boarding application.  

To delete a pricing intent, you need its pricingIntentId. Our gateway returned the pricingIntentId in the response of the [Create Pricing Intent](https://docs.payroc.com/api/schema/boarding/pricing-intents/create) method.  

**Note:** If you don't have the pricingIntentId, use our [List Pricing Intents](https://docs.payroc.com/api/schema/boarding/pricing-intents/list) method to search for the pricing intent.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.boarding.pricing_intents.delete(pricing_intent_id: '5');
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**pricing_intent_id:** `String` — Unique identifier that we assigned to the pricing intent.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::Boarding::PricingIntents::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.boarding.pricing_intents.<a href="/lib/payroc/boarding/pricing_intents/client.rb">partially_update</a>(pricing_intent_id, request) -> Payroc::Types::PricingIntent50</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to partially update a pricing intent. Structure your request to follow the [RFC 6902](https://datatracker.ietf.org/doc/html/rfc6902) standard.  

If you update a pricing intent, it won't affect merchants you've previously onboarded.  

To update a pricing intent, you need its pricingIntentId. Our gateway returned the pricingIntentId in the response of the [Create Pricing Intent](https://docs.payroc.com/api/schema/boarding/pricing-intents/create) method.  

**Note:** If you don't have the pricingIntentId, use our [List Pricing Intents](https://docs.payroc.com/api/schema/boarding/pricing-intents/list) method to search for the pricing intent.  

You can update the following details about a pricing intent:  

- Fees, including the base fees, processor fees, and gateway fees.  
- Custom name for the pricing intent.  
- Additional services that merchants can sign up for.  
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.boarding.pricing_intents.partially_update(
  pricing_intent_id: '5',
  idempotency_key: '8e03978e-40d5-43e8-bc93-6894a57f9324',
  request: []
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**pricing_intent_id:** `String` — Unique identifier that we assigned to the pricing intent.
    
</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String` — Unique identifier that you generate for each request. You must use the [UUID v4 format](https://www.rfc-editor.org/rfc/rfc4122) for the identifier. For more information about the idempotency key, go to [Idempotency](https://docs.payroc.com/api/idempotency).
    
</dd>
</dl>

<dl>
<dd>

**request:** `Internal::Types::Array[Payroc::Types::PatchDocument]` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::Boarding::PricingIntents::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Boarding MerchantPlatforms
<details><summary><code>client.boarding.merchant_platforms.<a href="/lib/payroc/boarding/merchant_platforms/client.rb">list</a>() -> Payroc::Types::PaginatedMerchants</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to return a [paginated](https://docs.payroc.com/api/pagination) list of merchant platforms that are linked to your ISV account.  

**Note**: If you want to view the details of a specific merchant platform and you have its merchantPlatformId, use our [Retrieve Merchant Platform](https://docs.payroc.com/api/schema/boarding/merchant-platforms/retrieve) method.  

Our gateway returns the following information about each merchant platform in the list:  
- Legal information, including its legal name and address.  
- Contact information, including the email address for the business.  
- Processing  account information, including the processingAccountId and status of each processing account that's linked to the merchant platform.  

For each merchant platform, we also return its merchantPlatformId and its linked processingAccountIds, which you can use to perform follow-on actions.  
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.boarding.merchant_platforms.list(
  before: '2571',
  after: '8516',
  limit: 1
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**before:** `String` 

Return the previous page of results before the value that you specify.  

You can’t send the before parameter in the same request as the after parameter. 
    
</dd>
</dl>

<dl>
<dd>

**after:** `String` 

Return the next page of results after the value that you specify.  

You can’t send the after parameter in the same request as the before parameter. 
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` — Limit the maximum number of results that we return for each page.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::Boarding::MerchantPlatforms::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.boarding.merchant_platforms.<a href="/lib/payroc/boarding/merchant_platforms/client.rb">create</a>(request) -> Payroc::Types::MerchantPlatform</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to board a merchant with Payroc.  

**Note**: This method is part of our Boarding solution. To help you understand how this method works with other Boarding methods, go to [Board a Merchant](https://docs.payroc.com/guides/board-merchants/boarding).  

In the request, include the following information:  
- Legal information, including its legal name and address.  
- Contact information, including the email address for the business.  
- Processing account information, including the pricing model, owners, and contacts for the processing account.  

When you send a successful request, we review the merchant's information. After we complete our review and approve the merchant, we assign:  
- **merchantPlatformId** - Unique identifier for the merchant platform.  
- **processingAccountId** - Unique identifier for each processing account linked to the merchant platform.  

You need to keep these to perform follow-on actions, for example, you need the processingAccountId to [order terminals](https://docs.payroc.com/api/schema/boarding/processing-accounts/create-terminal-order) for the processing account.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.boarding.merchant_platforms.create(
  idempotency_key: '8e03978e-40d5-43e8-bc93-6894a57f9324',
  business: {
    name: 'Example Corp',
    tax_id: '12-3456789',
    organization_type: 'privateCorporation',
    country_of_operation: 'US',
    addresses: [{
      address_1: '1 Example Ave.',
      address_2: 'Example Address Line 2',
      address_3: 'Example Address Line 3',
      city: 'Chicago',
      state: 'Illinois',
      country: 'US',
      postal_code: '60056',
      type: 'legalAddress'
    }],
    contact_methods: []
  },
  processing_accounts: [{
    doing_business_as: 'Pizza Doe',
    owners: [{
      first_name: 'Jane',
      middle_name: 'Helen',
      last_name: 'Doe',
      date_of_birth: '1964-03-22',
      address: {
        address_1: '1 Example Ave.',
        address_2: 'Example Address Line 2',
        address_3: 'Example Address Line 3',
        city: 'Chicago',
        state: 'Illinois',
        country: 'US',
        postal_code: '60056'
      },
      identifiers: [{
        type: 'nationalId',
        value: '000-00-4320'
      }],
      contact_methods: [],
      relationship: {
        equity_percentage: 48.5,
        title: 'CFO',
        is_control_prong: true,
        is_authorized_signatory: false
      }
    }],
    website: 'www.example.com',
    business_type: 'restaurant',
    category_code: 5999,
    merchandise_or_service_sold: 'Pizza',
    business_start_date: '2020-01-01',
    timezone: 'America/Chicago',
    address: {
      address_1: '1 Example Ave.',
      address_2: 'Example Address Line 2',
      address_3: 'Example Address Line 3',
      city: 'Chicago',
      state: 'Illinois',
      country: 'US',
      postal_code: '60056'
    },
    contact_methods: [],
    processing: {
      transaction_amounts: {
        average: 5000,
        highest: 10000
      },
      monthly_amounts: {
        average: 50000,
        highest: 100000
      },
      volume_breakdown: {
        card_present: 77,
        mail_or_telephone: 3,
        ecommerce: 20
      },
      is_seasonal: true,
      months_of_operation: ['jan', 'feb'],
      ach: {
        naics: '5812',
        previously_terminated_for_ach: false,
        refunds: {
          written_refund_policy: true,
          refund_policy_url: 'www.example.com/refund-poilcy-url'
        },
        estimated_monthly_transactions: 3000,
        limits: {
          single_transaction: 10000,
          daily_deposit: 200000,
          monthly_deposit: 6000000
        },
        transaction_types: ['prearrangedPayment', 'other'],
        transaction_types_other: 'anotherTransactionType'
      },
      card_acceptance: {
        debit_only: false,
        hsa_fsa: false,
        cards_accepted: ['visa', 'mastercard'],
        speciality_cards: {
          american_express_direct: {
            enabled: true,
            merchant_number: 'abc1234567'
          },
          electronic_benefits_transfer: {
            enabled: true,
            fns_number: '6789012'
          },
          other: {
            wex_merchant_number: 'abc1234567',
            voyager_merchant_id: 'abc1234567',
            fleet_merchant_id: 'abc1234567'
          }
        }
      }
    },
    funding: {
      funding_schedule: 'nextday',
      accelerated_funding_fee: 1999,
      daily_discount: false,
      funding_accounts: [{
        type: 'checking',
        use: 'creditAndDebit',
        name_on_account: 'Jane Doe',
        payment_methods: [],
        metadata: {
          yourCustomField: 'abc123'
        }
      }]
    },
    contacts: [{
      type: 'manager',
      first_name: 'Jane',
      middle_name: 'Helen',
      last_name: 'Doe',
      identifiers: [{
        type: 'nationalId',
        value: '000-00-4320'
      }],
      contact_methods: []
    }],
    metadata: {
      customerId: '2345'
    }
  }],
  metadata: {
    customerId: '2345'
  }
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**idempotency_key:** `String` — Unique identifier that you generate for each request. You must use the [UUID v4 format](https://www.rfc-editor.org/rfc/rfc4122) for the identifier. For more information about the idempotency key, go to [Idempotency](https://docs.payroc.com/api/idempotency).
    
</dd>
</dl>

<dl>
<dd>

**business:** `Payroc::Types::Business` 
    
</dd>
</dl>

<dl>
<dd>

**processing_accounts:** `Internal::Types::Array[Payroc::Types::CreateProcessingAccount]` — Array of processingAccounts objects.
    
</dd>
</dl>

<dl>
<dd>

**metadata:** `Internal::Types::Hash[String, String]` — Object that you can send to include custom data in the request.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::Boarding::MerchantPlatforms::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.boarding.merchant_platforms.<a href="/lib/payroc/boarding/merchant_platforms/client.rb">retrieve</a>(merchant_platform_id) -> Payroc::Types::MerchantPlatform</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to retrieve information about a merchant platform.  

To retrieve a merchant platform, you need its merchantPlatformId. Our gateway returned the merchantPlatformId in the response of the [Create Merchant Platform](https://docs.payroc.com/api/schema/boarding/merchant-platforms/create) method.  

**Note:** If you don't have the merchantPlatformId, use our [List Merchant Platforms](https://docs.payroc.com/api/schema/boarding/merchant-platforms/list) method to search for the merchant platform.

Our gateway returns the following information about the merchant platform:
-	Legal information, including its legal name and address.
-	Contact information, including the email address for the business. 
-	Processing account information, including the processingAccountId and status of each processing account that's linked to the merchant platform.  
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.boarding.merchant_platforms.retrieve(merchant_platform_id: '12345');
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**merchant_platform_id:** `String` — Unique identifier of the merchant platform that we sent to you when you created the merchant platform.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::Boarding::MerchantPlatforms::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.boarding.merchant_platforms.<a href="/lib/payroc/boarding/merchant_platforms/client.rb">list_processing_accounts</a>(merchant_platform_id) -> Payroc::Types::PaginatedProcessingAccounts</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to return a [paginated](https://docs.payroc.com/api/pagination) list of processing accounts linked to a merchant platform.  

**Note**: If you want to view the details of a specific processing account and you have its processingAccountId, use our [Retrieve Processing Account](https://docs.payroc.com/api/schema/boarding/processing-accounts/retrieve) method.  

Use the query parameters to filter the list of results that we return, for example, to search for only closed processing accounts.  

To list the processing accounts for a merchant platform, you need its merchantPlatformId. If you don't have the merchantPlatformId, use our [List Merchant Platforms](https://docs.payroc.com/api/schema/boarding/merchant-platforms/list) method to search for the merchant platform.

Our gateway returns the following information about eahc processing account in the list:  
- Business details, including its status, time zone, and address.  
- Owners' details, including their contact details.  
- Funding, pricing, and processing information, including its pricing model and funding accounts.  

For each processing account, we also return its processingAccountId, which you can use to perform follow-on actions.  
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.boarding.merchant_platforms.list_processing_accounts(
  merchant_platform_id: '12345',
  before: '2571',
  after: '8516',
  limit: 1,
  include_closed: true
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**merchant_platform_id:** `String` — Unique identifier of the merchant platform that we sent to you when you created the merchant platform.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String` 

Return the previous page of results before the value that you specify.  

You can’t send the before parameter in the same request as the after parameter. 
    
</dd>
</dl>

<dl>
<dd>

**after:** `String` 

Return the next page of results after the value that you specify.  

You can’t send the after parameter in the same request as the before parameter. 
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` — Limit the maximum number of results that we return for each page.
    
</dd>
</dl>

<dl>
<dd>

**include_closed:** `Internal::Types::Boolean` 

Indicates if you want to return closed processing accounts. This includes processing accounts that have a status of `terminated`, `cancelled`, or `rejected`.  
**Note**: By default, we return only open processing accounts.  
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::Boarding::MerchantPlatforms::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.boarding.merchant_platforms.<a href="/lib/payroc/boarding/merchant_platforms/client.rb">create_processing_account</a>(merchant_platform_id, request) -> Payroc::Types::ProcessingAccount</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to add an additional processing account to a merchant platform.  

To add a processing account to a merchant platform, you need the merchantPlatformId. Our gateway returned the merchantPlatformId in the response of the [Create Merchant Platform](https://docs.payroc.com/api/schema/boarding/merchant-platforms/create) method.  

**Note**: If you don't have the merchantPlatformId, use our [List Merchant Platforms](https://docs.payroc.com/api/schema/boarding/merchant-platforms/list) method to search for the merchant platform.  

In the request, include the following information:  
- Business details, including its business type, time zone, and address.  
- Owners' details, including their contact details.  
- Funding, pricing, and processing information, including its pricing model and funding accounts.  

When you send a successful request, we review the information about the processing account. After we complete our review and approve the processing account, we assign a processingAccountId, which you need to perform follow-on actions.  

**Note**: You can subscribe to our processingAccount.status.changed event to get notifications when we update the status of a processing account. For more information about how to subscribe to events, go to [Events List](https://docs.payroc.com/knowledge/events/events-list).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.boarding.merchant_platforms.create_processing_account(
  merchant_platform_id: '12345',
  idempotency_key: '8e03978e-40d5-43e8-bc93-6894a57f9324',
  doing_business_as: 'Pizza Doe',
  owners: [{
    first_name: 'Jane',
    middle_name: 'Helen',
    last_name: 'Doe',
    date_of_birth: '1964-03-22',
    address: {
      address_1: '1 Example Ave.',
      address_2: 'Example Address Line 2',
      address_3: 'Example Address Line 3',
      city: 'Chicago',
      state: 'Illinois',
      country: 'US',
      postal_code: '60056'
    },
    identifiers: [{
      type: 'nationalId',
      value: '000-00-4320'
    }],
    contact_methods: [],
    relationship: {
      equity_percentage: 51.5,
      title: 'CFO',
      is_control_prong: true,
      is_authorized_signatory: false
    }
  }],
  website: 'www.example.com',
  business_type: 'restaurant',
  category_code: 5999,
  merchandise_or_service_sold: 'Pizza',
  business_start_date: '2020-01-01',
  timezone: 'America/Chicago',
  address: {
    address_1: '1 Example Ave.',
    address_2: 'Example Address Line 2',
    address_3: 'Example Address Line 3',
    city: 'Chicago',
    state: 'Illinois',
    country: 'US',
    postal_code: '60056'
  },
  contact_methods: [],
  processing: {
    transaction_amounts: {
      average: 5000,
      highest: 10000
    },
    monthly_amounts: {
      average: 50000,
      highest: 100000
    },
    volume_breakdown: {
      card_present: 77,
      mail_or_telephone: 3,
      ecommerce: 20
    },
    is_seasonal: true,
    months_of_operation: ['jan', 'feb'],
    ach: {
      naics: '5812',
      previously_terminated_for_ach: false,
      refunds: {
        written_refund_policy: true,
        refund_policy_url: 'www.example.com/refund-poilcy-url'
      },
      estimated_monthly_transactions: 3000,
      limits: {
        single_transaction: 10000,
        daily_deposit: 200000,
        monthly_deposit: 6000000
      },
      transaction_types: ['prearrangedPayment', 'other'],
      transaction_types_other: 'anotherTransactionType'
    },
    card_acceptance: {
      debit_only: false,
      hsa_fsa: false,
      cards_accepted: ['visa', 'mastercard'],
      speciality_cards: {
        american_express_direct: {
          enabled: true,
          merchant_number: 'abc1234567'
        },
        electronic_benefits_transfer: {
          enabled: true,
          fns_number: '6789012'
        },
        other: {
          wex_merchant_number: 'abc1234567',
          voyager_merchant_id: 'abc1234567',
          fleet_merchant_id: 'abc1234567'
        }
      }
    }
  },
  funding: {
    funding_schedule: 'nextday',
    accelerated_funding_fee: 1999,
    daily_discount: false,
    funding_accounts: [{
      type: 'checking',
      use: 'creditAndDebit',
      name_on_account: 'Jane Doe',
      payment_methods: [],
      metadata: {
        yourCustomField: 'abc123'
      }
    }]
  },
  contacts: [{
    type: 'manager',
    first_name: 'Jane',
    middle_name: 'Helen',
    last_name: 'Doe',
    identifiers: [{
      type: 'nationalId',
      value: '000-00-4320'
    }],
    contact_methods: []
  }],
  metadata: {
    customerId: '2345'
  }
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**merchant_platform_id:** `String` — Unique identifier of the merchant platform that we sent to you when you created the merchant platform.
    
</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String` — Unique identifier that you generate for each request. You must use the [UUID v4 format](https://www.rfc-editor.org/rfc/rfc4122) for the identifier. For more information about the idempotency key, go to [Idempotency](https://docs.payroc.com/api/idempotency).
    
</dd>
</dl>

<dl>
<dd>

**request:** `Payroc::Types::CreateProcessingAccount` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::Boarding::MerchantPlatforms::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Boarding ProcessingAccounts
<details><summary><code>client.boarding.processing_accounts.<a href="/lib/payroc/boarding/processing_accounts/client.rb">retrieve</a>(processing_account_id) -> Payroc::Types::ProcessingAccount</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to retrieve information about a specific processing account.  

To retrieve a processing account, you need its processingAccountId. Our gateway returned the processingAccountId in the response of the [Create Merchant Platform](https://docs.payroc.com/api/schema/boarding/merchant-platforms/create) method or the [Create Processing Account](https://docs.payroc.com/api/schema/boarding/merchant-platforms/create-processing-account) method.  

**Note:** If you don't have the processingAccountId, use our [List Merchant Platform's Processing Accounts](https://docs.payroc.com/api/schema/boarding/merchant-platforms/list-processing-accounts) method to search for the processing account.  

Our gateway returns the following information about the processing account:  

-	Business information, including the Merchant Category Code (MCC), status of the processing account, and address of the business.  
-	Processing information, including the merchant’s refund policies and card types that the merchant accepts.  
-	Funding information, including funding schedules, funding fees, and details for the merchant’s funding accounts.  
-	Pricing information, including [HATEOAS](https://docs.payroc.com/knowledge/basic-concepts/hypermedia-as-the-engine-of-application-state-hateoas) links to retrieve the pricing program for the processing account.  
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.boarding.processing_accounts.retrieve(processing_account_id: '38765');
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**processing_account_id:** `String` — Unique identifier that we assigned to the processing account.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::Boarding::ProcessingAccounts::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.boarding.processing_accounts.<a href="/lib/payroc/boarding/processing_accounts/client.rb">list_processing_account_funding_accounts</a>(processing_account_id) -> Internal::Types::Array[Payroc::Types::FundingAccount]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to return a list of funding accounts linked to a processing acccount.  

To retrieve a list of funding accounts for a processing account, you need the processingAccountId. Our gateway returned the processingAccountId in the response of the [Create Merchant Platform](https://docs.payroc.com/api/schema/boarding/merchant-platforms/create) method or the [Create Proccessing Account](https://docs.payroc.com/api/schema/boarding/merchant-platforms/create-processing-account) method.  

Our gateway returns information about the following for each funding account in the list:  
- Account information, including the name on the account and payment methods.  
- Status, including whether we have approved or rejected the account.  

For each funding account, we also return its fundingAccountId, which you can use to perform follow-on actions.  
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.boarding.processing_accounts.list_processing_account_funding_accounts(processing_account_id: '38765');
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**processing_account_id:** `String` — Unique identifier that we assigned to the processing account.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::Boarding::ProcessingAccounts::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.boarding.processing_accounts.<a href="/lib/payroc/boarding/processing_accounts/client.rb">list_contacts</a>(processing_account_id) -> Payroc::Types::PaginatedContacts</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to return a list of contacts for a processing account.    

**Note:** If you want to view the details of a specific contact and you have their contactId, use our [Retrieve Contact](https://docs.payroc.com/api/schema/boarding/contacts/retrieve) method.  

To list contacts for a processing account, you need the processingAccountId. Our gateway returned the processingAccountId in the response of the [Create Merchant Platform](https://docs.payroc.com/api/schema/boarding/merchant-platforms/create) method or the [Create Processing Account](https://docs.payroc.com/api/schema/boarding/merchant-platforms/create-processing-account) method.  

Our gateway returns the following information about each contact:  

- Name and contact method, including their phone number or mobile number.  
- Role within the business, for example, if they are a manager.  

For each contact, we also return a contactId, which you can use to perform follow-on actions.  
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.boarding.processing_accounts.list_contacts(
  processing_account_id: '38765',
  before: '2571',
  after: '8516',
  limit: 1
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**processing_account_id:** `String` — Unique identifier that we assigned to the processing account.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String` 

Return the previous page of results before the value that you specify.  

You can’t send the before parameter in the same request as the after parameter. 
    
</dd>
</dl>

<dl>
<dd>

**after:** `String` 

Return the next page of results after the value that you specify.  

You can’t send the after parameter in the same request as the before parameter. 
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` — Limit the maximum number of results that we return for each page.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::Boarding::ProcessingAccounts::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.boarding.processing_accounts.<a href="/lib/payroc/boarding/processing_accounts/client.rb">get_processing_account_pricing_agreement</a>(processing_account_id) -> Payroc::Boarding::ProcessingAccounts::Types::GetProcessingAccountPricingAgreementProcessingAccountsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to retrieve the pricing agreement that we apply to a processing account.  

To retrieve the pricing agreement of a processing account, you need the processingAccountId. Our gateway returned the processingAccountId in the response to the [Create Merchant Platform](https://docs.payroc.com/api/schema/boarding/merchant-platforms/create) method and [Create Processing Account](https://docs.payroc.com/api/schema/boarding/merchant-platforms/create-processing-account) method.  

**Note:** If you don't have the processingAccountId, use our [List Merchant Platform’s Processing Accounts](https://docs.payroc.com/api/schema/boarding/merchant-platforms/list-processing-accounts) method to search for the processing account.  

Our gateway returns the following information about the pricing agreement that we apply to the processing account:  

- Base fees, including the annual fee and the fees for each chargeback and retrieval.  
- Processor fees, including the fees that we apply for processing card and ACH payments.  
- Gateway fees, including the setup fee and the fees for each transaction.  
- Service fees, including the fee that we apply if the merchant has signed up to a Hardware Advantage Plan.  
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.boarding.processing_accounts.get_processing_account_pricing_agreement(processing_account_id: '38765');
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**processing_account_id:** `String` — Unique identifier that we assigned to the processing account.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::Boarding::ProcessingAccounts::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.boarding.processing_accounts.<a href="/lib/payroc/boarding/processing_accounts/client.rb">list_owners</a>(processing_account_id) -> Payroc::Types::PaginatedOwners</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to return a list of owners of a processing account.  

**Note:** If you want to view the details of a specific owner and you have the ownerId, go to our [Retrieve Owner](https://docs.payroc.com/api/schema/boarding/owners/retrieve) method.  

To list the owners of a processing account, you need its processingAccountId. If you don't have the processingAccountId, use our [List Merchant Platform's Processing Accounts](https://docs.payroc.com/api/schema/boarding/merchant-platforms/list-processing-accounts) method to search for the processing account.  

Our gateway returns the following information about each owner in the list: 

- Name, date of birth, and address.  
- Contact details, including their email address.  
- Relationship to the business, including whether they are a control prong or authorized signatory, and their equity stake in the business.  
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.boarding.processing_accounts.list_owners(
  processing_account_id: '38765',
  before: '2571',
  after: '8516',
  limit: 1
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**processing_account_id:** `String` — Unique identifier that we assigned to the processing account.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String` 

Return the previous page of results before the value that you specify.  

You can’t send the before parameter in the same request as the after parameter. 
    
</dd>
</dl>

<dl>
<dd>

**after:** `String` 

Return the next page of results after the value that you specify.  

You can’t send the after parameter in the same request as the before parameter. 
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` — Limit the maximum number of results that we return for each page.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::Boarding::ProcessingAccounts::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.boarding.processing_accounts.<a href="/lib/payroc/boarding/processing_accounts/client.rb">create_reminder</a>(processing_account_id, request) -> Payroc::Boarding::ProcessingAccounts::Types::CreateReminderProcessingAccountsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to prompt a merchant to sign their pricing agreement.  

You can create a reminder only if you requested the merchant’s signature by email when you created the processing account for the merchant.  

To create a reminder, you need the processingAccountId. Our gateway returned the processingAccountId in the response of the [Create Merchant Platform](https://docs.payroc.com/api/schema/boarding/merchant-platforms/create) method or [Create Processing Account](https://docs.payroc.com/api/schema/boarding/merchant-platforms/create-processing-account) method. 

**Note:** If you don’t know the processingAccountId, use our [List Merchant Platform’s Processing Accounts](https://docs.payroc.com/api/schema/boarding/merchant-platforms/list-processing-accounts) method to search for the processing account.  

When you send a successful request, we send an email to the merchant that prompts them to sign their pricing agreement.  
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.boarding.processing_accounts.create_reminder(
  processing_account_id: '38765',
  idempotency_key: '8e03978e-40d5-43e8-bc93-6894a57f9324'
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**processing_account_id:** `String` — Unique identifier that we assigned to the processing account.
    
</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String` — Unique identifier that you generate for each request. You must use the [UUID v4 format](https://www.rfc-editor.org/rfc/rfc4122) for the identifier. For more information about the idempotency key, go to [Idempotency](https://docs.payroc.com/api/idempotency).
    
</dd>
</dl>

<dl>
<dd>

**request:** `Payroc::Boarding::ProcessingAccounts::Types::CreateReminderProcessingAccountsRequestBody` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::Boarding::ProcessingAccounts::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.boarding.processing_accounts.<a href="/lib/payroc/boarding/processing_accounts/client.rb">list_terminal_orders</a>(processing_account_id) -> Internal::Types::Array[Payroc::Types::TerminalOrder]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to return a [paginated](https://docs.payroc.com/api/pagination) list of terminal orders associated with a processing account.  

**Note:** If you want to view the details of a specific terminal order and you have its terminalOrderId, use our [Retrieve Terminal Order](https://docs.payroc.com/api/schema/boarding/terminal-orders/retrieve) method.  

Use the query parameters to filter the list of results that we return, for example, to search for terminal orders by their status.  

To list the terminal orders for a processing account, you need its processingAccountId. If you don't have the processingAccountId, use our [List Merchant Platforms](https://docs.payroc.com/api/schema/boarding/merchant-platforms/list) method to search for a merchant platform and its processing accounts.

Our gateway returns the following information for each terminal order in the list:  

- Status of the order  
- Items in the order  
- Training provider  
- Shipping information  

For each terminal order, we also return its terminalOrderId, which you can use to perform follow-on actions.   
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.boarding.processing_accounts.list_terminal_orders(
  processing_account_id: '38765',
  status: 'open',
  from_date_time: '2024-09-08T12:00:00Z',
  to_date_time: '2024-12-08T11:00:00Z'
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**processing_account_id:** `String` — Unique identifier that we assigned to the processing account.
    
</dd>
</dl>

<dl>
<dd>

**status:** `Payroc::Boarding::ProcessingAccounts::Types::ListTerminalOrdersProcessingAccountsRequestStatus` 
    
</dd>
</dl>

<dl>
<dd>

**from_date_time:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**to_date_time:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::Boarding::ProcessingAccounts::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.boarding.processing_accounts.<a href="/lib/payroc/boarding/processing_accounts/client.rb">create_terminal_order</a>(processing_account_id, request) -> Payroc::Types::TerminalOrder</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to order and configure terminals for a processing account.  

**Note**: You need the ID of the processing account before you can create an order. If you don't know the processingAccountId, go to the [Retrieve a Merchant Platform](https://docs.payroc.com/api/schema/boarding/merchant-platforms/retrieve) method.  

In the request, specify the gateway settings, device settings, and application settings for the terminal.  

In the response, our gateway returns information about the terminal order including its status and terminalOrderId that you can use to [retrieve the terminal order](https://docs.payroc.com/api/schema/boarding/terminal-orders/retrieve).  

**Note**: You can subscribe to the terminalOrder.status.changed event to get notifications when we update the status of a terminal order. For more information about how to subscribe to events, go to [Events Subscriptions](https://docs.payroc.com/guides/board-merchants/event-subscriptions).  
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.boarding.processing_accounts.create_terminal_order(
  processing_account_id: '38765',
  idempotency_key: '8e03978e-40d5-43e8-bc93-6894a57f9324',
  training_provider: 'payroc',
  shipping: {
    preferences: {
      method_: 'nextDay',
      saturday_delivery: true
    },
    address: {
      recipient_name: 'Recipient Name',
      business_name: 'Company Ltd',
      address_line_1: '1 Example Ave.',
      address_line_2: 'Example Address Line 2',
      city: 'Chicago',
      state: 'Illinois',
      postal_code: '60056',
      email: 'example@mail.com',
      phone: '2025550164'
    }
  },
  order_items: [{
    type: 'solution',
    solution_template_id: 'Roc Services_DX8000',
    solution_quantity: 1,
    device_condition: 'new',
    solution_setup: {
      timezone: 'America/Chicago',
      industry_template_id: 'Retail',
      gateway_settings: {
        merchant_portfolio_id: 'Company Ltd',
        merchant_template_id: 'Company Ltd Merchant Template',
        user_template_id: 'Company Ltd User Template',
        terminal_template_id: 'Company Ltd Terminal Template'
      },
      application_settings: {
        clerk_prompt: false,
        security: {
          refund_password: true,
          keyed_sale_password: false,
          reversal_password: true
        }
      },
      device_settings: {
        number_of_mobile_users: 2,
        communication_type: 'wifi'
      },
      receipt_notifications: {
        email_receipt: true,
        sms_receipt: false
      },
      taxes: [{
        tax_rate: 6,
        tax_label: 'Sales Tax'
      }],
      tips: {
        enabled: false
      },
      tokenization: true
    }
  }]
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**processing_account_id:** `String` — Unique identifier that we assigned to the processing account.
    
</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String` — Unique identifier that you generate for each request. You must use the [UUID v4 format](https://www.rfc-editor.org/rfc/rfc4122) for the identifier. For more information about the idempotency key, go to [Idempotency](https://docs.payroc.com/api/idempotency).
    
</dd>
</dl>

<dl>
<dd>

**training_provider:** `Payroc::Types::TrainingProvider` 
    
</dd>
</dl>

<dl>
<dd>

**shipping:** `Payroc::Boarding::ProcessingAccounts::Types::CreateTerminalOrderShipping` — Object that contains the shipping details for the terminal order. If you don't provide a shipping address, we use the Doing Business As (DBA) address of the processing account.
    
</dd>
</dl>

<dl>
<dd>

**order_items:** `Internal::Types::Array[Payroc::Types::OrderItem]` — Array of order items. Provide a minimum of 1 order item and a maximum of 10 order items.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::Boarding::ProcessingAccounts::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.boarding.processing_accounts.<a href="/lib/payroc/boarding/processing_accounts/client.rb">list_processing_terminals</a>(processing_account_id) -> Payroc::Types::PaginatedProcessingTerminals</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to return a [paginated](https://docs.payroc.com/api/pagination) list of processing terminals associated with a processing account.  

**Note:** If you want to view the details of a specific processing terminal and you have its processingTerminalId, use our [Retrieve Processing Terminal](https://docs.payroc.com/api/schema/boarding/processing-terminals/retrieve) method.  

To list the terminals for a processing account, you need its processingAccountId. If you don't have the processingAccountId, use our [List Merchant Platforms](https://docs.payroc.com/api/schema/boarding/merchant-platforms/list) method to search for a merchant platform and its processing accounts.   

Our gateway returns the following information for each processing terminal in the list:  

- Status indicating whether the terminal is active or inactive.  
- Configuration settings, including gateway settings and application settings.  
- Features, receipt settings, and security settings.  
- Devices that use the processing terminal's configuration.  

For each processing terminal, we also return its processingTerminalId, which you can use to perform follow-on actions.  
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.boarding.processing_accounts.list_processing_terminals(
  processing_account_id: '38765',
  before: '2571',
  after: '8516',
  limit: 1
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**processing_account_id:** `String` — Unique identifier that we assigned to the processing account.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String` 

Return the previous page of results before the value that you specify.  

You can’t send the before parameter in the same request as the after parameter. 
    
</dd>
</dl>

<dl>
<dd>

**after:** `String` 

Return the next page of results after the value that you specify.  

You can’t send the after parameter in the same request as the before parameter. 
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` — Limit the maximum number of results that we return for each page.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::Boarding::ProcessingAccounts::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Boarding ProcessingTerminals
<details><summary><code>client.boarding.processing_terminals.<a href="/lib/payroc/boarding/processing_terminals/client.rb">retrieve</a>(processing_terminal_id) -> Payroc::Types::ProcessingTerminal</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

**Important:** You can retrieve a processing terminal only if the terminal order was created using the Payroc API.

Use this method to retrieve information about a processing terminal.  

To retrieve a processing terminal, you need its processingTerminalId. Our gateway returned the processingTerminalId in the response of the [Create Terminal Order](https://docs.payroc.com/api/schema/boarding/processing-accounts/create-terminal-order) method.  

**Note:** If you don't have the processingTerminalId, use our [Retrieve Terminal Order](https://docs.payroc.com/api/schema/boarding/terminal-orders/retrieve) method or our [List Processing Terminals](https://docs.payroc.com/api/schema/boarding/processing-accounts/list-processing-terminals) method to search for the processing terminal.  

Our gateway returns the following information about the processing terminal:  

- Status indicating whether the terminal is active or inactive.  
- Configuration settings, including gateway settings and application settings.  
- Features, receipt settings, and security settings.  
- Devices that use the processing terminal's configuration.  
  
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.boarding.processing_terminals.retrieve(processing_terminal_id: '1234001');
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**processing_terminal_id:** `String` — Unique identifier that we assigned to the terminal.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::Boarding::ProcessingTerminals::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.boarding.processing_terminals.<a href="/lib/payroc/boarding/processing_terminals/client.rb">retrieve_host_configuration</a>(processing_terminal_id) -> Payroc::Types::HostConfiguration</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to retrieve the host processor configuration of a processing terminal. Integrate with this method only if you use your own gateway and want to validate the processor configuration.  

Our gateway returns the configuration settings for the merchant and the payment terminal.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.boarding.processing_terminals.retrieve_host_configuration(processing_terminal_id: '1234001');
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**processing_terminal_id:** `String` — Unique identifier that we assigned to the terminal.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::Boarding::ProcessingTerminals::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Boarding Contacts
<details><summary><code>client.boarding.contacts.<a href="/lib/payroc/boarding/contacts/client.rb">retrieve</a>(contact_id) -> Payroc::Types::Contact</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to retrieve details about a contact.  

To retrieve a contact, you need its contactId. Our gateway returned the contactId in the [Create Processing Account](https://docs.payroc.com/api/schema/boarding/merchant-platforms/create-processing-account) method.  

**Note:** If you don't have the contactId, use the [List Contacts](https://docs.payroc.com/api/schema/boarding/processing-accounts/list-contacts) method to search for the contact.  

Our gateway returns the following information about a contact:  

-	Name and contact method, including their phone number or mobile number.  
-	Role within the business, for example, if they are a manager. 
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.boarding.contacts.retrieve(contact_id: 1);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**contact_id:** `Integer` — Unique identifier for the contact.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::Boarding::Contacts::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.boarding.contacts.<a href="/lib/payroc/boarding/contacts/client.rb">update</a>(contact_id, request) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to update a contact of a processing account.  

To update a contact, you need its contactId. Our gateway returned the contactId in the response of the [Create Processing Account](https://docs.payroc.com/api/schema/boarding/merchant-platforms/create-processing-account) method.  

**Note:** If you don't have the contactId, use our [List Contacts](https://docs.payroc.com/api/schema/boarding/processing-accounts/list-contacts) method to search for the contact.  

You can update the following details about a contact:  

-	First name and last name.  
-	Contact details, including their phone number or mobile number.  
-	Identification details, including their identification type and number.  
-	Role within the business, for example, if they are a manager.  
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.boarding.contacts.update(
  contact_id: 1,
  type: 'manager',
  first_name: 'Jane',
  middle_name: 'Helen',
  last_name: 'Doe',
  identifiers: [{
    type: 'nationalId',
    value: '000-00-4320'
  }],
  contact_methods: []
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**contact_id:** `Integer` — Unique identifier for the contact.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Payroc::Types::Contact` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::Boarding::Contacts::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.boarding.contacts.<a href="/lib/payroc/boarding/contacts/client.rb">delete</a>(contact_id) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to delete a contact associated with a processing account.  

To delete a contact, you need their contactId. Our gateway returned the contactId in the response of the [Create Processing Account](https://docs.payroc.com/api/schema/boarding/merchant-platforms/create-processing-account) method.  

**Note:** If you don’t have the contactId, use our [Retrieve Processing Account](https://docs.payroc.com/api/schema/boarding/processing-accounts/retrieve) method or our [List Contacts](https://docs.payroc.com/api/schema/boarding/processing-accounts/list-contacts) method to search for the contact.  
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.boarding.contacts.delete(contact_id: 1);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**contact_id:** `Integer` — Unique identifier for the contact.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::Boarding::Contacts::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Boarding TerminalOrders
<details><summary><code>client.boarding.terminal_orders.<a href="/lib/payroc/boarding/terminal_orders/client.rb">retrieve</a>(terminal_order_id) -> Payroc::Types::TerminalOrder</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to retrieve information about a terminal order.  

To retrieve a terminal order, you need it's terminalOrderId. Our gateway returned the terminalOrderId in the response of the [Create Terminal Order](https://docs.payroc.com/api/schema/boarding/processing-accounts/create-terminal-order) method.  

**Note**: If you don't have the terminalOrderId, use our [List Terminal Orders](https://docs.payroc.com/api/schema/boarding/processing-accounts/list-terminal-orders) method to search for the terminal order.  

Our gateway returns the following information about the terminal order:  
- Status of the order  
- Items in the order  
- Training provider  
- Shipping information  

**Note**: You can subscribe to our terminalOrder.status.changed event to get notifications when we update the status of a terminal order. For more information about how to subscribe to events, go to [Events Subscriptions](https://docs.payroc.com/guides/board-merchants/event-subscriptions).  
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.boarding.terminal_orders.retrieve(terminal_order_id: '12345');
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**terminal_order_id:** `String` — Unique identifier of the terminal order.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::Boarding::TerminalOrders::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## CardPayments Payments
<details><summary><code>client.card_payments.payments.<a href="/lib/payroc/card_payments/payments/client.rb">list</a>() -> Payroc::Types::PaymentPaginatedListForRead</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to return a [paginated](https://docs.payroc.com/api/pagination) list of payments. 

**Note:** If you want to view the details of a specific payment and you have its paymentId, use our [Retrieve Payment](https://docs.payroc.com/api/schema/card-payments/payments/retrieve) method.  

Use query parameters to filter the list of results that we return, for example, to search for payments for a customer, a tip mode, or a date range.  

Our gateway returns the following information about each payment in the list:  

- Order details, including the transaction amount and when it was processed.  
- Payment card details, including the masked card number, expiry date, and payment method. 
- Cardholder details, including their contact information and shipping address. 
- Payment details, including the payment type, status, and response. 
 
For each transaction, we also return the paymentId and an optional secureTokenId, which you can use to perform follow-on actions. 
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.card_payments.payments.list(
  processing_terminal_id: '1234001',
  order_id: 'OrderRef6543',
  operator: 'Jane',
  cardholder_name: 'Sarah%20Hazel%20Hopper',
  first_6: '453985',
  last_4: '7062',
  tender: 'ebt',
  date_from: '2024-07-01T15:30:00Z',
  date_to: '2024-07-03T15:30:00Z',
  settlement_state: 'settled',
  settlement_date: '2024-07-02',
  payment_link_id: 'JZURRJBUPS',
  before: '2571',
  after: '8516',
  limit: 1
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**processing_terminal_id:** `String` — Filter by terminal ID.
    
</dd>
</dl>

<dl>
<dd>

**order_id:** `String` — Filter payments by order ID.
    
</dd>
</dl>

<dl>
<dd>

**operator:** `String` — Filter payments by operator.
    
</dd>
</dl>

<dl>
<dd>

**cardholder_name:** `String` — Filter payments by the cardholder’s name.
    
</dd>
</dl>

<dl>
<dd>

**first_6:** `String` — Filter payments by the first six digits of the card number that the customer used in the transaction.
    
</dd>
</dl>

<dl>
<dd>

**last_4:** `String` — Filter payments by the last four digits of the card number that the customer used in the transaction.
    
</dd>
</dl>

<dl>
<dd>

**tender:** `Payroc::CardPayments::Payments::Types::ListPaymentsRequestTender` — Filter by tender type.
    
</dd>
</dl>

<dl>
<dd>

**tip_mode:** `Payroc::CardPayments::Payments::Types::ListPaymentsRequestTipModeItem` — Filter payments by tip.
    
</dd>
</dl>

<dl>
<dd>

**type:** `Payroc::CardPayments::Payments::Types::ListPaymentsRequestTypeItem` — Filter payments by transaction type.
    
</dd>
</dl>

<dl>
<dd>

**status:** `Payroc::CardPayments::Payments::Types::ListPaymentsRequestStatusItem` — Filter payments by the status of the transaction.
    
</dd>
</dl>

<dl>
<dd>

**date_from:** `String` — Filter by payments that the processor processed after a specific date. The date format follows the ISO 8601 standard.
    
</dd>
</dl>

<dl>
<dd>

**date_to:** `String` — Filter by payments that the processer processed before a specific date. The date format follows the ISO 8601 standard.
    
</dd>
</dl>

<dl>
<dd>

**settlement_state:** `Payroc::CardPayments::Payments::Types::ListPaymentsRequestSettlementState` — Filter payments by the settlement status of the transaction.
    
</dd>
</dl>

<dl>
<dd>

**settlement_date:** `String` — Filter by payments that the processor settled on a specific date in the format **YYYY-MM-DD**.
    
</dd>
</dl>

<dl>
<dd>

**payment_link_id:** `String` — Unique identifier that our gateway assigned to the payment link.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String` 

Return the previous page of results before the value that you specify.  

You can’t send the before parameter in the same request as the after parameter. 
    
</dd>
</dl>

<dl>
<dd>

**after:** `String` 

Return the next page of results after the value that you specify.  

You can’t send the after parameter in the same request as the before parameter. 
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` — Limit the maximum number of results that we return for each page.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::CardPayments::Payments::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.card_payments.payments.<a href="/lib/payroc/card_payments/payments/client.rb">create</a>(request) -> Payroc::Types::Payment</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to run a sale or a pre-authorization with a customer's payment card. 

In the response, our gateway returns information about the card payment and a paymentId, which you need for the following methods:

-	[Retrieve payment](https://docs.payroc.com/api/schema/card-payments/payments/retrieve) - View the details of the card payment.
-	[Adjust payment](https://docs.payroc.com/api/schema/card-payments/payments/adjust) - Update the details of the card payment.
-	[Capture payment](https://docs.payroc.com/api/schema/card-payments/payments/capture)  - Capture the pre-authorization.
-	[Reverse payment](https://docs.payroc.com/api/schema/card-payments/refunds/reverse)  - Cancel the card payment if it's in an open batch.
-	[Refund payment](https://docs.payroc.com/api/schema/card-payments/refunds/create-referenced-refund)  - Run a referenced refund to return funds to the payment card.

**Payment methods** 

- **Cards** - Credit, debit, and EBT
- **Digital wallets** - [Apple Pay®](https://docs.payroc.com/guides/take-payments/apple-pay) and [Google Pay®](https://docs.payroc.com/guides/take-payments/google-pay) 
- **Tokens** - Secure tokens and single-use tokens

**Features** 

Our Create Payment method also supports the following features: 

- [Repeat payments](https://docs.payroc.com/guides/take-payments/repeat-payments/use-your-own-software) - Run multiple payments as part of a payment schedule that you manage with your own software. 
- **Offline sales** - Run a sale or a pre-authorization if the terminal loses its connection to our gateway. 
- [Tokenization](https://docs.payroc.com/guides/take-payments/save-payment-details) - Save card details to use in future transactions. 
- [3-D Secure](https://docs.payroc.com/guides/take-payments/3-d-secure) - Verify the identity of the cardholder. 
- [Custom fields](https://docs.payroc.com/guides/take-payments/add-custom-fields) - Add your own data to a payment. 
- **Tips** - Add tips to the card payment.  
- **Taxes** - Add local taxes to the card payment. 
- **Surcharging** - Add a surcharge to the card payment. 
- **Dual pricing** - Offer different prices based on payment method, for example, if you use our RewardPay Choice pricing program. 
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.card_payments.payments.create(
  idempotency_key: '8e03978e-40d5-43e8-bc93-6894a57f9324',
  channel: 'web',
  processing_terminal_id: '1234001',
  operator: 'Jane',
  order: {
    order_id: 'OrderRef6543',
    description: 'Large Pepperoni Pizza',
    amount: 4999,
    currency: 'USD'
  },
  customer: {
    first_name: 'Sarah',
    last_name: 'Hopper',
    billing_address: {
      address_1: '1 Example Ave.',
      address_2: 'Example Address Line 2',
      address_3: 'Example Address Line 3',
      city: 'Chicago',
      state: 'Illinois',
      country: 'US',
      postal_code: '60056'
    },
    shipping_address: {
      recipient_name: 'Sarah Hopper',
      address: {
        address_1: '1 Example Ave.',
        address_2: 'Example Address Line 2',
        address_3: 'Example Address Line 3',
        city: 'Chicago',
        state: 'Illinois',
        country: 'US',
        postal_code: '60056'
      }
    }
  },
  custom_fields: [{
    name: 'yourCustomField',
    value: 'abc123'
  }]
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**idempotency_key:** `String` — Unique identifier that you generate for each request. You must use the [UUID v4 format](https://www.rfc-editor.org/rfc/rfc4122) for the identifier. For more information about the idempotency key, go to [Idempotency](https://docs.payroc.com/api/idempotency).
    
</dd>
</dl>

<dl>
<dd>

**channel:** `Payroc::CardPayments::Payments::Types::PaymentRequestChannel` — Channel that the merchant used to receive the payment details.
    
</dd>
</dl>

<dl>
<dd>

**processing_terminal_id:** `String` — Unique identifier that we assigned to the terminal.
    
</dd>
</dl>

<dl>
<dd>

**operator:** `String` — Operator who ran the transaction.
    
</dd>
</dl>

<dl>
<dd>

**order:** `Payroc::Types::PaymentOrderRequest` 
    
</dd>
</dl>

<dl>
<dd>

**customer:** `Payroc::Types::Customer` 
    
</dd>
</dl>

<dl>
<dd>

**ip_address:** `Payroc::Types::IpAddress` 
    
</dd>
</dl>

<dl>
<dd>

**payment_method:** `Payroc::CardPayments::Payments::Types::PaymentRequestPaymentMethod` 

Polymorphic object that contains payment details.  

The value of the type parameter determines which variant you should use:  
-	`card` - Payment card details
-	`secureToken` - Secure token details
-	`digitalWallet` - Digital wallet details
-	`singleUseToken` - Single-use token details
    
</dd>
</dl>

<dl>
<dd>

**three_d_secure:** `Payroc::CardPayments::Payments::Types::PaymentRequestThreeDSecure` 

Polymorphic object that contains authentication information from 3-D Secure.  

The value of the serviceProvider parameter determines which variant you should use:  
-	`gateway` - Use our gateway to run a 3-D Secure check.
-	`thirdParty` - Use a third party to run a 3-D Secure check.
    
</dd>
</dl>

<dl>
<dd>

**credential_on_file:** `Payroc::Types::SchemasCredentialOnFile` 
    
</dd>
</dl>

<dl>
<dd>

**offline_processing:** `Payroc::Types::OfflineProcessing` 
    
</dd>
</dl>

<dl>
<dd>

**auto_capture:** `Internal::Types::Boolean` 

Indicates if we should automatically capture the payment amount.  

- `true` - Run a sale and automatically capture the transaction.
- `false`- Run a pre-authorization and capture the transaction later.  
  
**Note:** If you send `false` and the terminal doesn't support pre-authorization, we set the transaction's status to pending. The merchant must capture the transaction to take payment from the customer.
    
</dd>
</dl>

<dl>
<dd>

**process_as_sale:** `Internal::Types::Boolean` 

Indicates if we should immediately settle the sale transaction. The merchant cannot adjust the transaction if we immediately settle it.  
**Note:** If the value for **processAsSale** is `true`, the gateway ignores the value in **autoCapture**.
    
</dd>
</dl>

<dl>
<dd>

**custom_fields:** `Internal::Types::Array[Payroc::Types::CustomField]` — Array of customField objects.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::CardPayments::Payments::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.card_payments.payments.<a href="/lib/payroc/card_payments/payments/client.rb">retrieve</a>(payment_id) -> Payroc::Types::RetrievedPayment</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to retrieve information about a card payment.  

To retrieve a payment, you need its paymentId. Our gateway returned the paymentId in the response of the [Create Payment](https://docs.payroc.com/api/schema/card-payments/payments/create) method.  

**Note:** If you don't have the paymentId, use our [List Payments](https://docs.payroc.com/api/schema/card-payments/payments/list) method to search for the payment.  

Our gateway returns the following information about the payment:  

- Order details, including the transaction amount and when it was processed.  
- Payment card details, including the masked card number, expiry date, and payment method.  
- Cardholder details, including their contact information and shipping address.  
- Payment details, including the payment type, status, and response.  

If the merchant saved the customer's card details, our gateway returns a secureTokenID, which you can use to perform follow-on actions.  
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.card_payments.payments.retrieve(payment_id: 'M2MJOG6O2Y');
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**payment_id:** `String` — Unique identifier of the payment that the merchant wants to retrieve.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::CardPayments::Payments::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.card_payments.payments.<a href="/lib/payroc/card_payments/payments/client.rb">adjust</a>(payment_id, request) -> Payroc::Types::Payment</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to adjust a payment in an open batch. 

To adjust a payment, you need its paymentId. Our gateway returned the paymentId in the response of the [Create Payment](https://docs.payroc.com/api/schema/card-payments/payments/create) method.

**Note:** If you don't have the paymentId, use our [List Payments](https://docs.payroc.com/api/schema/card-payments/payments/list) method to search for the payment. 

You can adjust the following details of the payment:
- Sale amount and tip amount
- Payment status
- Cardholder shipping address and contact information
- Cardholder signature data

Our gateway returns information about the adjusted payment, including information about the payment card and the cardholder.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.card_payments.payments.adjust(
  payment_id: 'M2MJOG6O2Y',
  idempotency_key: '8e03978e-40d5-43e8-bc93-6894a57f9324',
  adjustments: []
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**payment_id:** `String` — Unique identifier of the payment that the merchant wants to retrieve.
    
</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String` — Unique identifier that you generate for each request. You must use the [UUID v4 format](https://www.rfc-editor.org/rfc/rfc4122) for the identifier. For more information about the idempotency key, go to [Idempotency](https://docs.payroc.com/api/idempotency).
    
</dd>
</dl>

<dl>
<dd>

**operator:** `String` — Operator who adjusted the payment.
    
</dd>
</dl>

<dl>
<dd>

**adjustments:** `Internal::Types::Array[Payroc::CardPayments::Payments::Types::PaymentAdjustmentAdjustmentsItem]` 

Array of polymorphic objects which contain information about adjustments to a payment.  

The value of the type parameter determines which variant you should use:
-	`order` - Tip information.
-	`status` - Status of the transaction.
-	`customer` - Customer's contact information and shipping address.
-	`signature` - Customer's signature.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::CardPayments::Payments::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.card_payments.payments.<a href="/lib/payroc/card_payments/payments/client.rb">capture</a>(payment_id, request) -> Payroc::Types::Payment</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to capture a pre-authorization. 

To capture a pre-authorization, you need its paymentId. Our gateway returned the paymentId in the response of the [Create Payment](https://docs.payroc.com/api/schema/card-payments/payments/create) method.

**Note:** If you don't have the paymentId, use our [List Payments](https://docs.payroc.com/api/schema/card-payments/payments/list) method to search for the payment.

Depending on the amount you want to capture, complete the following:
-	**Capture the full amount of the pre-authorization** - Don't send a value for the amount parameter in your request.
-	**Capture less than the amount of the pre-authorization** - Send a value for the amount parameter in your request. 
-	**Capture more than the amount of the pre-authorization** - Adjust the pre-authorization before you capture it. For more information about adjusting a pre-authorization, go to [Adjust Payment](https://docs.payroc.com/api/schema/card-payments/payments/adjust).

If your request is successful, our gateway takes the amount from the payment card. 

**Note:** For more information about pre-authorizations and captures, go to [Run a pre-authorization](https://docs.payroc.com/guides/integrate/run-a-pre-authorization).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.card_payments.payments.capture(
  payment_id: 'M2MJOG6O2Y',
  idempotency_key: '8e03978e-40d5-43e8-bc93-6894a57f9324',
  processing_terminal_id: '1234001',
  operator: 'Jane',
  amount: 4999,
  breakdown: {
    subtotal: 4999,
    duty_amount: 499,
    freight_amount: 500,
    items: [{
      unit_price: 4000,
      quantity: 1
    }]
  }
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**payment_id:** `String` — Unique identifier of the payment that the merchant wants to retrieve.
    
</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String` — Unique identifier that you generate for each request. You must use the [UUID v4 format](https://www.rfc-editor.org/rfc/rfc4122) for the identifier. For more information about the idempotency key, go to [Idempotency](https://docs.payroc.com/api/idempotency).
    
</dd>
</dl>

<dl>
<dd>

**processing_terminal_id:** `String` — Unique identifier that our gateway assigned to the terminal.
    
</dd>
</dl>

<dl>
<dd>

**operator:** `String` — Operator who captured the payment.
    
</dd>
</dl>

<dl>
<dd>

**amount:** `Integer` 

Amount that the merchant wants to capture. The value is in the currency's lowest denomination, for example, cents.  
**Note:** If the merchant does not send an amount, we capture the total amount of the transaction.
    
</dd>
</dl>

<dl>
<dd>

**breakdown:** `Payroc::Types::ItemizedBreakdownRequest` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::CardPayments::Payments::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## CardPayments Refunds
<details><summary><code>client.card_payments.refunds.<a href="/lib/payroc/card_payments/refunds/client.rb">reverse</a>(payment_id, request) -> Payroc::Types::Payment</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to cancel or to partially cancel a payment in an open batch. This is also known as voiding a payment.  

To cancel a payment, you need its paymentId. Our gateway returned the paymentId in the response of the [Create Payment](https://docs.payroc.com/api/schema/card-payments/payments/create) method.  

**Note:** If you don't have the paymentId, use our [List Payments](https://docs.payroc.com/api/schema/card-payments/payments/list) method to search for the payment.  

If your request is successful, our gateway removes the payment from the merchant's open batch and no funds are taken from the cardholder's account. 
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.card_payments.refunds.reverse(
  payment_id: 'M2MJOG6O2Y',
  idempotency_key: '8e03978e-40d5-43e8-bc93-6894a57f9324',
  amount: 4999
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**payment_id:** `String` — Unique identifier of the payment that the merchant wants to retrieve.
    
</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String` — Unique identifier that you generate for each request. You must use the [UUID v4 format](https://www.rfc-editor.org/rfc/rfc4122) for the identifier. For more information about the idempotency key, go to [Idempotency](https://docs.payroc.com/api/idempotency).
    
</dd>
</dl>

<dl>
<dd>

**operator:** `String` — Operator who reversed the payment.
    
</dd>
</dl>

<dl>
<dd>

**amount:** `Integer` 

Amount of the payment that the merchant wants to reverse. The value is in the currency’s lowest denomination, for example, cents.  
**Note:** If the merchant doesn’t send an amount, we reverse the total amount of the transaction.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::CardPayments::Refunds::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.card_payments.refunds.<a href="/lib/payroc/card_payments/refunds/client.rb">create_referenced_refund</a>(payment_id, request) -> Payroc::Types::Payment</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to refund a payment that is in a closed batch.  

To refund a payment, you need its paymentId. Our gateway returned the paymentId in the response of the [Create Payment](https://docs.payroc.com/api/schema/card-payments/payments/create) method.  

**Note:** If you don't have the paymentId, use our [List Payments](https://docs.payroc.com/api/schema/card-payments/payments/list) method to search for the payment.  

If your refund is successful, our gateway returns the payment amount to the cardholder's account.  

**Things to consider**  

- If the merchant refunds a payment that is in an open batch, our gateway reverses the payment.
- Some merchants can run unreferenced refunds, which means that they don't need a paymentId to return an amount to a customer. For more information about how to run an unreferenced refund, go to [Create Refund](https://docs.payroc.com/api/schema/card-payments/refunds/create-unreferenced-refund).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.card_payments.refunds.create_referenced_refund(
  payment_id: 'M2MJOG6O2Y',
  idempotency_key: '8e03978e-40d5-43e8-bc93-6894a57f9324',
  amount: 4999,
  description: 'Refund for order OrderRef6543'
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**payment_id:** `String` — Unique identifier of the payment that the merchant wants to retrieve.
    
</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String` — Unique identifier that you generate for each request. You must use the [UUID v4 format](https://www.rfc-editor.org/rfc/rfc4122) for the identifier. For more information about the idempotency key, go to [Idempotency](https://docs.payroc.com/api/idempotency).
    
</dd>
</dl>

<dl>
<dd>

**operator:** `String` — Operator who refunded the payment.
    
</dd>
</dl>

<dl>
<dd>

**amount:** `Integer` — Amount of the payment that the merchant wants to refund. The value is in the currency’s lowest denomination, for example, cents.
    
</dd>
</dl>

<dl>
<dd>

**description:** `String` — Reason for the refund.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::CardPayments::Refunds::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.card_payments.refunds.<a href="/lib/payroc/card_payments/refunds/client.rb">list</a>() -> Payroc::Types::RefundPaginatedList</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to return a [paginated](https://docs.payroc.com/api/pagination) list of refunds.  

**Note:** If you want to view the details of a specific refund and you have its refundId, use our [Retrieve Refund](https://docs.payroc.com/api/schema/card-payments/refunds/retrieve) method.  

Use query parameters to filter the list of results that we return, for example, to search for refunds for a customer, a tender type, or a date range.
Our gateway returns the following information about each refund in the list:  
- Order details, including the refund amount and when we processed the refund.
- Payment card details, including the masked card number, expiry date, and payment method.
- Cardholder details, including their contact information and shipping address.  

For referenced refunds, our gateway also returns details about the payment that the refund is linked to.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.card_payments.refunds.list(
  processing_terminal_id: '1234001',
  order_id: 'OrderRef6543',
  operator: 'Jane',
  cardholder_name: 'Sarah%20Hazel%20Hopper',
  first_6: '453985',
  last_4: '7062',
  tender: 'ebt',
  date_from: '2024-07-01T15:30:00Z',
  date_to: '2024-07-03T15:30:00Z',
  settlement_state: 'settled',
  settlement_date: '2024-07-02',
  before: '2571',
  after: '8516',
  limit: 1
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**processing_terminal_id:** `String` — Filter by terminal ID.
    
</dd>
</dl>

<dl>
<dd>

**order_id:** `String` — Filter refunds by the unique identifier that the merchant assigned to the order.
    
</dd>
</dl>

<dl>
<dd>

**operator:** `String` — Filter refunds by the operator who initiated the request.
    
</dd>
</dl>

<dl>
<dd>

**cardholder_name:** `String` — Filter refunds by cardholder name.
    
</dd>
</dl>

<dl>
<dd>

**first_6:** `String` — Filter refunds by the first six digits of the card number.
    
</dd>
</dl>

<dl>
<dd>

**last_4:** `String` — Filter refunds by the last four digits of the card number.
    
</dd>
</dl>

<dl>
<dd>

**tender:** `Payroc::CardPayments::Refunds::Types::ListRefundsRequestTender` — Filter by tender type.
    
</dd>
</dl>

<dl>
<dd>

**status:** `Payroc::CardPayments::Refunds::Types::ListRefundsRequestStatusItem` — Filter refunds by the current status of the refund.
    
</dd>
</dl>

<dl>
<dd>

**date_from:** `String` — Filter by refunds processed after a specific date. The date format follows the ISO 8601 standard.
    
</dd>
</dl>

<dl>
<dd>

**date_to:** `String` — Filter by refunds processed before a specific date. The date format follows the ISO 8601 standard.
    
</dd>
</dl>

<dl>
<dd>

**settlement_state:** `Payroc::CardPayments::Refunds::Types::ListRefundsRequestSettlementState` — Status of the settlement.
    
</dd>
</dl>

<dl>
<dd>

**settlement_date:** `String` — Date the transaction was settled.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String` 

Return the previous page of results before the value that you specify.  

You can’t send the before parameter in the same request as the after parameter. 
    
</dd>
</dl>

<dl>
<dd>

**after:** `String` 

Return the next page of results after the value that you specify.  

You can’t send the after parameter in the same request as the before parameter. 
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` — Limit the maximum number of results that we return for each page.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::CardPayments::Refunds::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.card_payments.refunds.<a href="/lib/payroc/card_payments/refunds/client.rb">create_unreferenced_refund</a>(request) -> Payroc::Types::RetrievedRefund</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to create an unreferenced refund. An unreferenced refund is a refund that isn't linked to a payment.  

**Note:** If you have the paymentId of the payment you want to refund, use our [Refund Payment](https://docs.payroc.com/api/schema/card-payments/refunds/create-referenced-refund) method. If you use our Refund Payment method, our gateway sends the refund amount to the customer's original payment method and links the refund to the payment.  

In the request, you must provide the customer's payment details and the refund amount.  

In the response, our gateway returns information about the refund and a refundId, which you need for the following methods:  

- [Retrieve refund](https://docs.payroc.com/api/schema/card-payments/refunds/retrieve) - View the details of the refund.  
- [Adjust refund](https://docs.payroc.com/api/schema/card-payments/refunds/adjust) - Update the details of the refund.  
- [Reverse refund](https://docs.payroc.com/api/schema/card-payments/refunds/reverse-refund) - Cancel the refund if it's in an open batch.  
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.card_payments.refunds.create_unreferenced_refund(
  idempotency_key: '8e03978e-40d5-43e8-bc93-6894a57f9324',
  channel: 'pos',
  processing_terminal_id: '1234001',
  order: {
    order_id: 'OrderRef6543',
    description: 'Refund for order OrderRef6543',
    amount: 4999,
    currency: 'USD'
  },
  custom_fields: [{
    name: 'yourCustomField',
    value: 'abc123'
  }]
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**idempotency_key:** `String` — Unique identifier that you generate for each request. You must use the [UUID v4 format](https://www.rfc-editor.org/rfc/rfc4122) for the identifier. For more information about the idempotency key, go to [Idempotency](https://docs.payroc.com/api/idempotency).
    
</dd>
</dl>

<dl>
<dd>

**channel:** `Payroc::CardPayments::Refunds::Types::UnreferencedRefundChannel` — Channel that the merchant used to request the refund.
    
</dd>
</dl>

<dl>
<dd>

**processing_terminal_id:** `String` — Unique identifier that we assigned to the terminal.
    
</dd>
</dl>

<dl>
<dd>

**operator:** `String` — Operator who initiated the request.
    
</dd>
</dl>

<dl>
<dd>

**order:** `Payroc::Types::RefundOrder` 
    
</dd>
</dl>

<dl>
<dd>

**customer:** `Payroc::Types::Customer` 
    
</dd>
</dl>

<dl>
<dd>

**ip_address:** `Payroc::Types::IpAddress` 
    
</dd>
</dl>

<dl>
<dd>

**refund_method:** `Payroc::CardPayments::Refunds::Types::UnreferencedRefundRefundMethod` 

Polymorphic object that contains information about the payment method that the merchant uses to refund the customer.  

The value of the type parameter determines which variant you should use:
-	`card` - Payment card details
-	`secureToken` - Secure token details
    
</dd>
</dl>

<dl>
<dd>

**custom_fields:** `Internal::Types::Array[Payroc::Types::CustomField]` — Array of customField objects.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::CardPayments::Refunds::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.card_payments.refunds.<a href="/lib/payroc/card_payments/refunds/client.rb">retrieve</a>(refund_id) -> Payroc::Types::RetrievedRefund</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to retrieve information about a refund.  

To retrieve a refund, you need its refundId. Our gateway returned the refundId in the response of the [Refund Payment](https://docs.payroc.com/api/schema/card-payments/refunds/create-referenced-refund) method or the [Create Refund](https://docs.payroc.com/api/schema/card-payments/refunds/create-unreferenced-refund) method.  

**Note:** If you don't have the refundId, use our [List Refunds](https://docs.payroc.com/api/schema/card-payments/refunds/list) method to search for the refund.  

Our gateway returns the following information about the refund:  
- Order details, including the refund amount and when we processed the refund.
- Payment card details, including the masked card number, expiry date, and payment method.
- Cardholder details, including their contact information and shipping address.  

If the refund is a referenced refund, our gateway also returns details about the payment that the refund is linked to.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.card_payments.refunds.retrieve(refund_id: 'CD3HN88U9F');
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**refund_id:** `String` — Unique identifier that our gateway assigned to the refund.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::CardPayments::Refunds::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.card_payments.refunds.<a href="/lib/payroc/card_payments/refunds/client.rb">adjust</a>(refund_id, request) -> Payroc::Types::RetrievedRefund</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to adjust a refund in an open batch.  

To adjust a refund, you need its refundId. Our gateway returned the refundId in the response of the [Refund Payment](https://docs.payroc.com/api/schema/card-payments/refunds/create-referenced-refund) method or the [Create Refund](https://docs.payroc.com/api/schema/card-payments/refunds/create-unreferenced-refund) method.  

**Note:** If you don’t have the refundId, use our [List Refunds](https://docs.payroc.com/api/schema/card-payments/refunds/list) method to search for the refund.  

You can adjust the following details of the refund:
- Customer details, including shipping address and contact information.
- Status of the refund.  

Our gateway returns information about the adjusted refund, including:
- Order details, including the refund amount and when we processed the refund.
- Payment card details, including the masked card number, expiry date, and payment method.
- Cardholder details, including their contact information and shipping address.  

If the refund is a referenced refund, our gateway also returns details about the payment that the refund is linked to.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.card_payments.refunds.adjust(
  refund_id: 'CD3HN88U9F',
  idempotency_key: '8e03978e-40d5-43e8-bc93-6894a57f9324',
  operator: 'Jane',
  adjustments: []
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**refund_id:** `String` — Unique identifier that our gateway assigned to the refund.
    
</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String` — Unique identifier that you generate for each request. You must use the [UUID v4 format](https://www.rfc-editor.org/rfc/rfc4122) for the identifier. For more information about the idempotency key, go to [Idempotency](https://docs.payroc.com/api/idempotency).
    
</dd>
</dl>

<dl>
<dd>

**operator:** `String` — Operator who requested the adjustment to the refund.
    
</dd>
</dl>

<dl>
<dd>

**adjustments:** `Internal::Types::Array[Payroc::CardPayments::Refunds::Types::RefundAdjustmentAdjustmentsItem]` 

Array of polymorphic objects that contain information about adjustments to the refund.  

The value of the type parameter determines which variant you should use:  
-	`status` - Status of the transaction.
-	`customer` - Customer's contact information and shipping address.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::CardPayments::Refunds::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.card_payments.refunds.<a href="/lib/payroc/card_payments/refunds/client.rb">reverse_refund</a>(refund_id) -> Payroc::Types::RetrievedRefund</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to cancel a refund in an open batch.  

To cancel a refund, you need its refundId. Our gateway returned the refundId in the response of the [Refund Payment](https://docs.payroc.com/api/schema/card-payments/refunds/create-referenced-refund) or [Create Refund](https://docs.payroc.com/api/schema/card-payments/refunds/create-unreferenced-refund) method.  

**Note:** If you don’t have the refundId, use our [List Refunds](https://docs.payroc.com/api/schema/card-payments/refunds/list) method to search for the refund.  

If your request is successful, the gateway removes the refund from the merchant’s open batch and no funds are returned to the cardholder’s account.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.card_payments.refunds.reverse_refund(
  refund_id: 'CD3HN88U9F',
  idempotency_key: '8e03978e-40d5-43e8-bc93-6894a57f9324'
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**refund_id:** `String` — Unique identifier that our gateway assigned to the refund.
    
</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String` — Unique identifier that you generate for each request. You must use the [UUID v4 format](https://www.rfc-editor.org/rfc/rfc4122) for the identifier. For more information about the idempotency key, go to [Idempotency](https://docs.payroc.com/api/idempotency).
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::CardPayments::Refunds::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Funding FundingRecipients
<details><summary><code>client.funding.funding_recipients.<a href="/lib/payroc/funding/funding_recipients/client.rb">list</a>() -> Payroc::Types::PaginatedFundRecipients</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to return a [paginated](https://docs.payroc.com/api/pagination) list of funding recipients linked to your account.  

Note: If you want to view the details of a specific funding recipient and you have its recipientId, use our [Retrieve Funding Recipient](https://docs.payroc.com/api/schema/funding/funding-recipients/retrieve) method.  

Our gateway returns the following information about each funding recipient in the list:  
- Tax ID and Doing Business As (DBA) name.  
- Address and contact details.  
- Funding accounts linked to the funding recipient.  

For each funding recipient, we also return the recipientId, which you can use to perform follow-on actions.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.funding.funding_recipients.list(
  before: '2571',
  after: '8516',
  limit: 1
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**before:** `String` 

Return the previous page of results before the value that you specify.  

You can’t send the before parameter in the same request as the after parameter. 
    
</dd>
</dl>

<dl>
<dd>

**after:** `String` 

Return the next page of results after the value that you specify.  

You can’t send the after parameter in the same request as the before parameter. 
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` — Limit the maximum number of results that we return for each page.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::Funding::FundingRecipients::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.funding.funding_recipients.<a href="/lib/payroc/funding/funding_recipients/client.rb">create</a>(request) -> Payroc::Types::FundingRecipient</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to create a funding recipient. 

A funding recipient is a business or organization that can receive funds but can't run transactions, for example, a charity.  

In the request, include the following information:  
-	Legal information, including its tax ID, Doing Business As (DBA) name, and address.  
-	Contact information, including the email address.  
-	Owners' details, including their contact details. 
-	Funding account details.  

Our gateway returns the recipientId of the funding recipient, which you can use to run follow-on actions. 
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.funding.funding_recipients.create(
  idempotency_key: '8e03978e-40d5-43e8-bc93-6894a57f9324',
  recipient_type: 'privateCorporation',
  tax_id: '12-3456789',
  doing_business_as: 'Pizza Doe',
  address: {
    address_1: '1 Example Ave.',
    address_2: 'Example Address Line 2',
    address_3: 'Example Address Line 3',
    city: 'Chicago',
    state: 'Illinois',
    country: 'US',
    postal_code: '60056'
  },
  contact_methods: [],
  metadata: {
    yourCustomField: 'abc123'
  },
  owners: [{
    first_name: 'Jane',
    middle_name: 'Helen',
    last_name: 'Doe',
    date_of_birth: '1964-03-22',
    address: {
      address_1: '1 Example Ave.',
      city: 'Chicago',
      state: 'Illinois',
      country: 'US',
      postal_code: '60056'
    },
    identifiers: [{
      type: 'nationalId',
      value: '000-00-4320'
    }],
    contact_methods: [],
    relationship: {
      equity_percentage: 48.5,
      title: 'CFO',
      is_control_prong: true,
      is_authorized_signatory: false
    }
  }],
  funding_accounts: [{
    type: 'checking',
    use: 'credit',
    name_on_account: 'Jane Doe',
    payment_methods: []
  }]
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**idempotency_key:** `String` — Unique identifier that you generate for each request. You must use the [UUID v4 format](https://www.rfc-editor.org/rfc/rfc4122) for the identifier. For more information about the idempotency key, go to [Idempotency](https://docs.payroc.com/api/idempotency).
    
</dd>
</dl>

<dl>
<dd>

**recipient_type:** `Payroc::Funding::FundingRecipients::Types::CreateFundingRecipientRecipientType` — Type or legal structure of the funding recipient.
    
</dd>
</dl>

<dl>
<dd>

**tax_id:** `String` — Employer identification number (EIN) or Social Security number (SSN).
    
</dd>
</dl>

<dl>
<dd>

**charity_id:** `String` — Government identifier of the charity.
    
</dd>
</dl>

<dl>
<dd>

**doing_business_as:** `String` — Trading name of the business or organization.
    
</dd>
</dl>

<dl>
<dd>

**address:** `Payroc::Types::Address` — Polymorphic object that contains address information for a funding recipient.
    
</dd>
</dl>

<dl>
<dd>

**contact_methods:** `Internal::Types::Array[Payroc::Types::ContactMethod]` 

Array of polymorphic objects, which contain contact information.  

**Note:** You must provide an email address.

The value of the type parameter determines which variant you should use:  
-	`email` - Email address 
-	`phone` - Phone number
-	`mobile` - Mobile number
-	`fax` - Fax number
    
</dd>
</dl>

<dl>
<dd>

**metadata:** `Internal::Types::Hash[String, String]` — [Metadata](https://docs.payroc.com/api/metadata) object you can use to include custom data with your request.
    
</dd>
</dl>

<dl>
<dd>

**owners:** `Internal::Types::Array[Payroc::Types::Owner]` — Array of owner objects. Each object contains information about an individual who owns or manages the funding recipient.
    
</dd>
</dl>

<dl>
<dd>

**funding_accounts:** `Internal::Types::Array[Payroc::Types::FundingAccount]` — Array of fundingAccount objects that you can use to add funding accounts to the funding recipient.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::Funding::FundingRecipients::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.funding.funding_recipients.<a href="/lib/payroc/funding/funding_recipients/client.rb">retrieve</a>(recipient_id) -> Payroc::Types::FundingRecipient</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to retrieve information about a funding recipient.  

To retrieve a funding recipient, you need its recipientId. Our gateway returned the recipientId in the response of the [Create Funding Recipient](https://docs.payroc.com/api/schema/funding/funding-recipients/create) method.  

**Note:** If you don't have the recipientId, use our [List Funding Recipients](https://docs.payroc.com/api/schema/funding/funding-recipients/list) method to search for the funding recipient.  

Our gateway returns the following information about the funding recipient:  

- Tax ID and Doing Business As (DBA) name.  
- Address and contact details.  
- Funding accounts linked to the funding recipient.  
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.funding.funding_recipients.retrieve(recipient_id: 1);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**recipient_id:** `Integer` — Unique identifier that we assigned to the funding recipient.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::Funding::FundingRecipients::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.funding.funding_recipients.<a href="/lib/payroc/funding/funding_recipients/client.rb">update</a>(recipient_id, request) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to update the details of a funding recipient. If a request contains significant changes, we might need to re-approve the funding recipient.  

To update a funding recipient, you need it's recipientId. Our gateway returned the recipientId in the response of the [Create Funding Recipient](https://docs.payroc.com/api/schema/funding/funding-recipients/create) method.  

**Note**: If you don't have the recipientId, use our [List Funding Recipients](https://docs.payroc.com/api/schema/funding/funding-recipients/list) method to search for the funding recipient.  

You can update the following details of a funding recipient:  
- Doing Business As (DBA) name  
- Tax ID and charity ID  
- Address and contact methods  
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.funding.funding_recipients.update(
  recipient_id: 1,
  recipient_type: 'privateCorporation',
  tax_id: '12-3456789',
  doing_business_as: 'Doe Hot Dogs',
  address: {
    address_1: '2 Example Ave.',
    address_2: 'Example Address Line 2',
    address_3: 'Example Address Line 3',
    city: 'Chicago',
    state: 'Illinois',
    country: 'US',
    postal_code: '60056'
  },
  contact_methods: [],
  metadata: {
    responsiblePerson: 'Jane Doe'
  },
  owners: [{
    owner_id: 12346,
    link: {
      rel: 'owner',
      href: 'https://api.payroc.com/v1/owners/12346',
      method_: 'get'
    }
  }],
  funding_accounts: [{
    funding_account_id: 124,
    status: 'approved',
    link: {
      rel: 'fundingAccount',
      href: 'https://api.payroc.com/v1/funding-accounts/124',
      method_: 'get'
    }
  }]
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**recipient_id:** `Integer` — Unique identifier that we assigned to the funding recipient.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Payroc::Types::FundingRecipient` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::Funding::FundingRecipients::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.funding.funding_recipients.<a href="/lib/payroc/funding/funding_recipients/client.rb">delete</a>(recipient_id) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to delete a funding recipient, including its funding accounts and owners.  

To delete a funding recipient, you need its recipientId. Our gateway returned the recipientId in the response of the [Create Funding Recipient](https://docs.payroc.com/api/schema/funding/funding-recipients/create) method.   

**Note**: If you don't have the recipientId, use our [List Funding Recipients](https://docs.payroc.com/api/schema/funding/funding-recipients/list) method to search for the funding recipient.  
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.funding.funding_recipients.delete(recipient_id: 1);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**recipient_id:** `Integer` — Unique identifier that we assigned to the funding recipient.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::Funding::FundingRecipients::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.funding.funding_recipients.<a href="/lib/payroc/funding/funding_recipients/client.rb">list_accounts</a>(recipient_id) -> Internal::Types::Array[Payroc::Types::FundingAccount]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use  this method to return a list of funding accounts associated with a funding recipient.  

**Note:** If you want to view the details of a specific funding account and you have its fundingAccountId, use our [Retrieve Funding Account](https://docs.payroc.com/api/schema/funding/funding-accounts/retrieve) method.  

To retrieve the funding accounts associated with a funding recipient, you need the recipientId. If you don't have the recipientId, use our [List Funding Recipients](https://docs.payroc.com/api/schema/funding/funding-recipients/list) method to search for the funding recipient.  
        
Our gateway returns the following information about each funding account:  
-	Name of the account holder.  
-	ACH details for the account.  
-	Status of the account.  

Our gateway also returns the fundingAccountId, which you can use to run follow-on actions.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.funding.funding_recipients.list_accounts(recipient_id: 1);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**recipient_id:** `Integer` — Unique identifier that we assigned to the funding recipient.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::Funding::FundingRecipients::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.funding.funding_recipients.<a href="/lib/payroc/funding/funding_recipients/client.rb">create_account</a>(recipient_id, request) -> Payroc::Types::FundingAccount</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to create a funding account and add it to a funding recipient.  

To add a funding account to a funding recipient, you need the recipientId. Our gateway returned the recipientId in the response of the [Create Funding Recipient](https://docs.payroc.com/api/schema/funding/funding-recipients/create) method.  

**Note:** If you don't have the recipientId, use our [List Funding Recipients](https://docs.payroc.com/api/schema/funding/funding-recipients/list) method to search for the funding recipient.  

In the request, include the following information:  
-	Account type, for example, if the account is a checking or savings account.  
-	Account holder's name.  
-	ACH information, including the routing number and account number of the account.  

Our gateway returns the fundingAccountId, which you can use to run follow-on actions.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.funding.funding_recipients.create_account(
  recipient_id: 1,
  idempotency_key: '8e03978e-40d5-43e8-bc93-6894a57f9324',
  type: 'savings',
  use: 'credit',
  name_on_account: 'Fred Nerk',
  payment_methods: [],
  metadata: {
    responsiblePerson: 'Jane Doe'
  }
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**recipient_id:** `Integer` — Unique identifier that we assigned to the funding recipient.
    
</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String` — Unique identifier that you generate for each request. You must use the [UUID v4 format](https://www.rfc-editor.org/rfc/rfc4122) for the identifier. For more information about the idempotency key, go to [Idempotency](https://docs.payroc.com/api/idempotency).
    
</dd>
</dl>

<dl>
<dd>

**request:** `Payroc::Types::FundingAccount` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::Funding::FundingRecipients::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.funding.funding_recipients.<a href="/lib/payroc/funding/funding_recipients/client.rb">list_owners</a>(recipient_id) -> Internal::Types::Array[Payroc::Types::Owner]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to return a list of owners of a funding recipient.  

**Note:** If you want to view the details of a specific owner and you have their ownerId, use our [Retrieve Owner](https://docs.payroc.com/api/schema/boarding/owners/retrieve) method.  

To list the owners of a funding recipient, you need its recipientId. Our gateway returned the recipientId in the response of the [Create Funding Recipient](https://docs.payroc.com/api/schema/funding/funding-recipients/create) method. If you don't have the recipientId, use our [List Funding Recipients](https://docs.payroc.com/api/schema/funding/funding-recipients/list) method to search for the funding recipient.  

Our gateway returns the following information about each owner in the list:  
-	Name, date of birth, and address.  
-	Contact details, including their email address.  
-	Relationship to the funding recipient.  

Our gateway also returns the ownerId, which you can use to perform follow-on actions.  
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.funding.funding_recipients.list_owners(recipient_id: 1);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**recipient_id:** `Integer` — Unique identifier that we assigned to the funding recipient.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::Funding::FundingRecipients::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.funding.funding_recipients.<a href="/lib/payroc/funding/funding_recipients/client.rb">create_owner</a>(recipient_id, request) -> Payroc::Types::Owner</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to add an additional owner to a funding recipient.  

To add an owner to a funding recipient, you need the recipientId. Our gateway returned the recipientId in the response of the [Create Funding Recipient](https://docs.payroc.com/api/schema/funding/funding-recipients/create) method.  

**Note:** If you don't have the recipientId, use our [List Funding Recipients](https://docs.payroc.com/api/schema/funding/funding-recipients/list) method to search for the funding recipient.  

In the request, include the following information about the owner:  

- Name, date of birth, and address.  
- Contact details, including their email address.  
- Relationship to the funding recipient, including whether they are a control prong.  

In the response, our gateway returns the ownerId, which you can use to run follow-on actions.  
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.funding.funding_recipients.create_owner(
  recipient_id: 1,
  idempotency_key: '8e03978e-40d5-43e8-bc93-6894a57f9324',
  first_name: 'Fred',
  middle_name: 'Jim',
  last_name: 'Nerk',
  date_of_birth: '1980-01-19',
  address: {
    address_1: '2 Example Ave.',
    city: 'Chicago',
    state: 'Illinois',
    country: 'US',
    postal_code: '60056'
  },
  identifiers: [{
    type: 'nationalId',
    value: '000-00-9876'
  }],
  contact_methods: [],
  relationship: {
    equity_percentage: 51.5,
    title: 'CEO',
    is_control_prong: false,
    is_authorized_signatory: true
  }
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**recipient_id:** `Integer` — Unique identifier that we assigned to the funding recipient.
    
</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String` — Unique identifier that you generate for each request. You must use the [UUID v4 format](https://www.rfc-editor.org/rfc/rfc4122) for the identifier. For more information about the idempotency key, go to [Idempotency](https://docs.payroc.com/api/idempotency).
    
</dd>
</dl>

<dl>
<dd>

**request:** `Payroc::Types::Owner` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::Funding::FundingRecipients::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Funding FundingAccounts
<details><summary><code>client.funding.funding_accounts.<a href="/lib/payroc/funding/funding_accounts/client.rb">list</a>() -> Payroc::Types::ListFundingAccounts</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to return a [paginated](https://docs.payroc.com/api/pagination) list of funding accounts associated with your account.  

**Note:** If you want to view the details of a specific funding account and you have its fundingAccountId, use our [Retrieve Funding Account](https://docs.payroc.com/api/schema/funding/funding-accounts/retrieve) method.  

Our gateway returns the following information about each funding account in the list:  
- Name of the account holder and ACH details for the account.  
- Status of the account.  
- Whether we send funds to the account, withdraw funds from the account, or both.  

For each funding account, we also return the fundingAccountId, which you can use to perform follow-on actions.  
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.funding.funding_accounts.list(
  before: '2571',
  after: '8516',
  limit: 1
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**before:** `String` 

Return the previous page of results before the value that you specify.  

You can’t send the before parameter in the same request as the after parameter. 
    
</dd>
</dl>

<dl>
<dd>

**after:** `String` 

Return the next page of results after the value that you specify.  

You can’t send the after parameter in the same request as the before parameter. 
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` — Limit the maximum number of results that we return for each page.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::Funding::FundingAccounts::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.funding.funding_accounts.<a href="/lib/payroc/funding/funding_accounts/client.rb">retrieve</a>(funding_account_id) -> Payroc::Types::FundingAccount</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to retrieve information about a funding account.  

To retrieve a funding account, you need its fundingAccountId. Our gateway returned the fundingAccountId when you created the funding account.  

**Note:** If you don't have the fundingAccountId, use our [List Funding Accounts](https://docs.payroc.com/api/schema/funding/funding-accounts/list) method to search for the account.  

Our gateway returns the following information about the funding account:  
- Name of the account holder and ACH details for the account.  
- Status of the account.  
- Whether we send funds to the account, withdraw funds from the account, or both.  
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.funding.funding_accounts.retrieve(funding_account_id: 1);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**funding_account_id:** `Integer` — Unique identifier of the funding account.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::Funding::FundingAccounts::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.funding.funding_accounts.<a href="/lib/payroc/funding/funding_accounts/client.rb">update</a>(funding_account_id, request) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

> **Important:** You can't update the details of a funding account that is associated with a processing account.  

Use this method to update the details of a funding account that is associated with a funding recipient.  

To update a funding account, you need its fundingAccountId. Our gateway returned the fundingAccountId when you created the funding account.  

**Note:** If you don’t have the fundingAccountId, use our [List Funding Accounts](https://docs.payroc.com/api/schema/funding/funding-accounts/list) method to search for the funding account.  

You can update the following details about the funding account: 
-	Account type. 
-	Account holder's name. 
-	ACH information for the account. 
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.funding.funding_accounts.update(
  funding_account_id: 1,
  type: 'savings',
  use: 'credit',
  name_on_account: 'Fred Nerk',
  payment_methods: [],
  metadata: {
    responsiblePerson: 'Jane Doe'
  }
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**funding_account_id:** `Integer` — Unique identifier of the funding account.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Payroc::Types::FundingAccount` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::Funding::FundingAccounts::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.funding.funding_accounts.<a href="/lib/payroc/funding/funding_accounts/client.rb">delete</a>(funding_account_id) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

> **Important:** You can't delete a funding account that is associated with a processing account.  

Use this method to delete a funding account that is associated with a funding recipient.  

To delete a funding account, you need its fundingAccountId. Our gateway returned the fundingAccountId when you created the funding account.  

**Note:** If you don't have the fundingAccountId, use our [List Funding Accounts](https://docs.payroc.com/api/schema/funding/funding-accounts/list) method to search for the funding account.  
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.funding.funding_accounts.delete(funding_account_id: 1);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**funding_account_id:** `Integer` — Unique identifier of the funding account.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::Funding::FundingAccounts::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Funding FundingInstructions
<details><summary><code>client.funding.funding_instructions.<a href="/lib/payroc/funding/funding_instructions/client.rb">list</a>() -> Payroc::Funding::FundingInstructions::Types::ListFundingInstructionsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

> Important: You can return a list of funding instructions from only the previous two years. If you want to view a funding instruction from more than two years ago and you have its instructionId, use our [Retrieve Funding Instruction](https://docs.payroc.com/api/schema/funding/funding-instructions/retrieve) method.  

Use this method to return a [paginated](https://docs.payroc.com/api/pagination) list of funding instructions within a specific date range.  

**Note:** If you want to view the details of a specific funding instruction and you have its instructionId, use our [Retrieve Funding Instruction](https://docs.payroc.com/api/schema/funding/funding-instructions/retrieve) method.  

Our gateway returns the following information for each instruction in the list:  
-	Status of the funding instruction.  
-	Funding information, including which merchant's funding balance we distribute and the funding account that we send the balance to.  

For each funding instruction, we also return the instructionId, which you can use to perform follow-on actions. 
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.funding.funding_instructions.list(
  before: '2571',
  after: '8516',
  limit: 1,
  date_from: '2024-07-01',
  date_to: '2024-07-03'
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**before:** `String` 

Return the previous page of results before the value that you specify.  

You can’t send the before parameter in the same request as the after parameter. 
    
</dd>
</dl>

<dl>
<dd>

**after:** `String` 

Return the next page of results after the value that you specify.  

You can’t send the after parameter in the same request as the before parameter. 
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` — Limit the maximum number of results that we return for each page.
    
</dd>
</dl>

<dl>
<dd>

**date_from:** `String` — Filter by funding instructions sent after a specific date. Send a value in **YYYY-MM-DD** format.
    
</dd>
</dl>

<dl>
<dd>

**date_to:** `String` — Filter by funding instructions sent before a specific date. Send a value in **YYYY-MM-DD** format.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::Funding::FundingInstructions::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.funding.funding_instructions.<a href="/lib/payroc/funding/funding_instructions/client.rb">create</a>(request) -> Payroc::Types::Instruction</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to create a funding instruction that tells us how to distribute the funds from your merchants' transactions.  

**Note:** Before you create a funding instruction, you can use our [List Funding Balances](https://docs.payroc.com/api/schema/funding/funding-activity/retrieve-balance) method to view the amount of available funds that a merchant has.  

In your request, include an array of merchantInstruction objects. Each merchantInstruction object contains the following:  
-	Merchant ID (MID) of the merchant whose funding balance you want to distribute.  
-	Funding account that you want to send funds to.  
-	Amount that you want to send to the funding account.  

Our gateway returns the instructionId, which you can use to run follow-on actions.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.funding.funding_instructions.create(
  idempotency_key: '8e03978e-40d5-43e8-bc93-6894a57f9324',
  merchants: [{
    merchant_id: '4525644354',
    recipients: [{
      funding_account_id: 123,
      payment_method: 'ACH',
      amount: {
        value: 120000,
        currency: 'USD'
      },
      metadata: {
        yourCustomField: 'abc123'
      }
    }]
  }],
  metadata: {
    yourCustomField: 'abc123'
  }
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**idempotency_key:** `String` — Unique identifier that you generate for each request. You must use the [UUID v4 format](https://www.rfc-editor.org/rfc/rfc4122) for the identifier. For more information about the idempotency key, go to [Idempotency](https://docs.payroc.com/api/idempotency).
    
</dd>
</dl>

<dl>
<dd>

**request:** `Payroc::Types::Instruction` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::Funding::FundingInstructions::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.funding.funding_instructions.<a href="/lib/payroc/funding/funding_instructions/client.rb">retrieve</a>(instruction_id) -> Payroc::Types::Instruction</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to retrieve information about a funding instruction.  

To retrieve a funding instruction, you need its instructionId. Our gateway returned the instructionId in the response of the [Create Funding Instruction](https://docs.payroc.com/api/schema/funding/funding-instructions/create) method. 

**Note:** If you don't have the instructionId, use our [List Funding Instructions](https://docs.payroc.com/api/schema/funding/funding-instructions/list) method to search for the funding instruction.  

Our gateway returns the following information about the funding instruction:  
-	Status of the funding instruction.  
-	Funding information, including which merchant's funding balance we distribute and the funding account that we send the balance to.  
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.funding.funding_instructions.retrieve(instruction_id: 1);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**instruction_id:** `Integer` — Unique identifier that we assigned to the funding instruction.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::Funding::FundingInstructions::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.funding.funding_instructions.<a href="/lib/payroc/funding/funding_instructions/client.rb">update</a>(instruction_id, request) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

> **Important:** You can update a funding instruction only if its status is `accepted`. To view the status of a funding instruction, use our [Retrieve Funding Instruction](https://docs.payroc.com/api/schema/funding/funding-instructions/retrieve) method. 

Use this method to update the details of a funding instruction.  

To update a funding instruction, you need its instructionId. Our gateway returned the instructionId in the response of the [Create Funding Instruction](https://docs.payroc.com/api/schema/funding/funding-instructions/create) method.  

**Note:** If you don't have the fundingInstructionId, use our [List Funding Instructions](https://docs.payroc.com/api/schema/funding/funding-instructions/list) method to search for the funding instruction.  

You can modify the following information for the funding instruction:  
-	Merchant ID (MID) of the merchant whose funding balance you want to distribute.  
-	Funding account that you want to send funds to.  
-	Amount that you want to send to the funding account.  
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.funding.funding_instructions.update(
  instruction_id: 1,
  merchants: [{
    merchant_id: '9876543219',
    recipients: [{
      funding_account_id: 124,
      payment_method: 'ACH',
      amount: {
        value: 69950,
        currency: 'USD'
      },
      metadata: {
        supplier: 'IT Support Services'
      }
    }]
  }],
  metadata: {
    instructionCreatedBy: 'Jane Doe'
  }
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**instruction_id:** `Integer` — Unique identifier that we assigned to the funding instruction.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Payroc::Types::Instruction` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::Funding::FundingInstructions::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.funding.funding_instructions.<a href="/lib/payroc/funding/funding_instructions/client.rb">delete</a>(instruction_id) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

> **Important:** You can delete a funding instruction only if its status is `accepted`. To view the status of a funding instruction, use our [Retrieve Funding Instruction](https://docs.payroc.com/api/schema/funding/funding-instructions/retrieve) method.  

Use this method to delete a funding instruction.  

To delete a funding instruction, you need its instructionId. Our gateway returned the instructionId in the response of the [Create Funding Instruction](https://docs.payroc.com/api/schema/funding/funding-instructions/create) method.  

**Note:** If you don't have the instructionId, use our [List Funding Instructions](https://docs.payroc.com/api/schema/funding/funding-instructions/list) method to search for the funding instruction.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.funding.funding_instructions.delete(instruction_id: 1);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**instruction_id:** `Integer` — Unique identifier that we assigned to the funding instruction.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::Funding::FundingInstructions::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Funding FundingActivity
<details><summary><code>client.funding.funding_activity.<a href="/lib/payroc/funding/funding_activity/client.rb">retrieve_balance</a>() -> Payroc::Funding::FundingActivity::Types::RetrieveBalanceFundingActivityResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to return a [paginated](https://docs.payroc.com/api/pagination) list of funding balances available for each merchant linked to your account.  

Use query parameters to filter the list of results we return, for example, to search for the funding balance for a specific merchant.  

Our gateway returns the following information about each merchant in the list:  
- Total funds for the merchant.  
- Available funds that you can use for funding instructions.  
- Pending funds that we have not yet sent to funding accounts.  
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.funding.funding_activity.retrieve_balance(
  before: '2571',
  after: '8516',
  limit: 1,
  merchant_id: '4525644354'
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**before:** `String` 

Return the previous page of results before the value that you specify.  

You can’t send the before parameter in the same request as the after parameter. 
    
</dd>
</dl>

<dl>
<dd>

**after:** `String` 

Return the next page of results after the value that you specify.  

You can’t send the after parameter in the same request as the before parameter. 
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` — Limit the maximum number of results that we return for each page.
    
</dd>
</dl>

<dl>
<dd>

**merchant_id:** `String` — Filter results by the unique identifier that the processor assigned to the merchant.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::Funding::FundingActivity::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.funding.funding_activity.<a href="/lib/payroc/funding/funding_activity/client.rb">list</a>() -> Payroc::Funding::FundingActivity::Types::ListFundingActivityResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to return a [paginated](https://docs.payroc.com/api/pagination) list of activity associated with your merchants' funding balances within a specific date range.  

Use query parameters to filter the list of results we return, for example, to view the activity for a specific merchant's funding balance.  

Our gateway returns the following information about each activity in the list:
- Name of the merchant who owns the funding balance.
-	Amount of funds added or removed from the funding balance.
-	Funding account that received funds from the funding balance.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.funding.funding_activity.list(
  before: '2571',
  after: '8516',
  limit: 1,
  date_from: '2024-07-02',
  date_to: '2024-07-03',
  merchant_id: '4525644354'
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**before:** `String` 

Return the previous page of results before the value that you specify.  

You can’t send the before parameter in the same request as the after parameter. 
    
</dd>
</dl>

<dl>
<dd>

**after:** `String` 

Return the next page of results after the value that you specify.  

You can’t send the after parameter in the same request as the before parameter. 
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` — Limit the maximum number of results that we return for each page.
    
</dd>
</dl>

<dl>
<dd>

**date_from:** `String` — Filter by activity after a specific date. Send a value in **YYYY-MM-DD** format.
    
</dd>
</dl>

<dl>
<dd>

**date_to:** `String` — Filter by activity before a specific date. Send a value in **YYYY-MM-DD** format.
    
</dd>
</dl>

<dl>
<dd>

**merchant_id:** `String` — Filter results by the unique identifier that the processor assigned to the merchant.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::Funding::FundingActivity::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Notifications EventSubscriptions
<details><summary><code>client.notifications.event_subscriptions.<a href="/lib/payroc/notifications/event_subscriptions/client.rb">list</a>() -> Payroc::Types::PaginatedEventSubscriptions</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to return a [paginated](https://docs.payroc.com/api/pagination) list of event subscriptions that are linked to your ISV account.  

**Note:** If you want to view the details of a specific event subscription and you have its id, use our [Retrieve Event Subscription](https://docs.payroc.com/api/schema/notifications/event-subscriptions/retrieve) method.  

Use query parameters to filter the list of results that we return, for example, to search for subscriptions with a specific status or an event type.  

Our gateway returns the following information about each subscription in the list:  
- Event types that you have subscribed to.  
- Whether you have enabled notifications for the subscription.  
- How we contact you when an event occurs, including the endpoint that send notifications to.  
- If there are any issues when we try to send you a notification, for example, if we can't contact your endpoint.  

For each event subscription, we also return its id, which you can use to perform follow-on actions.  
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.notifications.event_subscriptions.list(
  status: 'registered',
  event: 'processingAccount.status.changed'
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**status:** `Payroc::Notifications::EventSubscriptions::Types::ListEventSubscriptionsRequestStatus` — Filter event subscriptions by subscription status.
    
</dd>
</dl>

<dl>
<dd>

**event:** `String` — Filter event subscriptions by an event type. For a list of event types, go to [Events List](https://docs.payroc.com/knowledge/events/events-list).
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::Notifications::EventSubscriptions::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.notifications.event_subscriptions.<a href="/lib/payroc/notifications/event_subscriptions/client.rb">create</a>(request) -> Payroc::Types::EventSubscription</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to create an event subscription that we use to notify you when an event occurs, for example, when we change the status of a processing account.  

In the request, include the events that you want to subscribe to and the public endpoint that we send event notifications to. For a complete list of events that you can subscribe to, go to [Events List](https://docs.payroc.com/knowledge/events/events-list).  

In the response, our gateway returns the id of the event subscription, which you can use to perform follow-on actions.  
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.notifications.event_subscriptions.create(
  idempotency_key: '8e03978e-40d5-43e8-bc93-6894a57f9324',
  enabled: true,
  event_types: ['processingAccount.status.changed'],
  notifications: [],
  metadata: {}
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**idempotency_key:** `String` — Unique identifier that you generate for each request. You must use the [UUID v4 format](https://www.rfc-editor.org/rfc/rfc4122) for the identifier. For more information about the idempotency key, go to [Idempotency](https://docs.payroc.com/api/idempotency).
    
</dd>
</dl>

<dl>
<dd>

**request:** `Payroc::Types::EventSubscription` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::Notifications::EventSubscriptions::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.notifications.event_subscriptions.<a href="/lib/payroc/notifications/event_subscriptions/client.rb">retrieve</a>(subscription_id) -> Payroc::Types::EventSubscription</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to retrieve the details of an event subscription.  

In your request, include the subscriptionId that we sent to you when we created the event subscription.  
  
**Note:** If you don't know the subscriptionId of the event subscription, go to [List event subscriptions](https://docs.payroc.com/api/schema/notifications/event-subscriptions/list).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.notifications.event_subscriptions.retrieve(subscription_id: 1);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**subscription_id:** `Integer` 

Unique identifier that we assigned to the event subscription.  
**Note:** Our gateway returned the subscriptionId in the id field in the response of the [Create Event Subscription](https://docs.payroc.com/api/schema/notifications/event-subscriptions/create) method.  
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::Notifications::EventSubscriptions::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.notifications.event_subscriptions.<a href="/lib/payroc/notifications/event_subscriptions/client.rb">update</a>(subscription_id, request) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to update the details of an event subscription.  

To update an event subscription, you need its subscriptionId. Our gateway returned the subscriptionId in the response of the [Create Event Subscription](https://docs.payroc.com/api/schema/notifications/event-subscriptions/create) method.  

**Note:** If you don’t have the subscriptionId, use our [List Event Subscriptions](https://docs.payroc.com/api/schema/notifications/event-subscriptions/list) method to search for the event subscription.  

You can update the following details about an event subscription:  

- Status of the event subscription.  
- Events that you have subscribed to. For a list of events that you can subscribe to, go to [Events list](https://docs.payroc.com/knowledge/events/events-list).  
- Information about how we contact you when an event occurs.  
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.notifications.event_subscriptions.update(
  subscription_id: 1,
  enabled: true,
  event_types: ['processingAccount.status.changed'],
  notifications: [],
  metadata: {}
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**subscription_id:** `Integer` 

Unique identifier that we assigned to the event subscription.  
**Note:** Our gateway returned the subscriptionId in the id field in the response of the [Create Event Subscription](https://docs.payroc.com/api/schema/notifications/event-subscriptions/create) method.  
    
</dd>
</dl>

<dl>
<dd>

**request:** `Payroc::Types::EventSubscription` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::Notifications::EventSubscriptions::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.notifications.event_subscriptions.<a href="/lib/payroc/notifications/event_subscriptions/client.rb">delete</a>(subscription_id) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to delete an event subscription.  

> **Important:** After you delete an event subscription, you can’t recover it. You won't receive event notifications from the event subscription.  

To delete an event subscription, you need its subscriptionId. Our gateway returned the subscriptionId in the response of the [Create Event Subscription](https://docs.payroc.com/api/schema/notifications/event-subscriptions/create) method.  

If you want to stop receiving event notifications but don't want to delete the event subscription, use our [Update Event Subscription](https://docs.payroc.com/api/schema/notifications/event-subscriptions/update) method to deactivate it.  
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.notifications.event_subscriptions.delete(subscription_id: 1);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**subscription_id:** `Integer` 

Unique identifier that we assigned to the event subscription.  
**Note:** Our gateway returned the subscriptionId in the id field in the response of the [Create Event Subscription](https://docs.payroc.com/api/schema/notifications/event-subscriptions/create) method.  
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::Notifications::EventSubscriptions::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.notifications.event_subscriptions.<a href="/lib/payroc/notifications/event_subscriptions/client.rb">partially_update</a>(subscription_id, request) -> Payroc::Types::EventSubscription</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to partially update an event subscription. Structure your request to follow the [RFC 6902](https://datatracker.ietf.org/doc/html/rfc6902) standard.  

To update an event subscription, you need its subscriptionId. Our gateway returned the subscriptionId in the id field in the response of the [Create Event Subscription](https://docs.payroc.com/api/schema/notifications/event-subscriptions/create) method.  

**Note:** If you don't have the subscriptionId, use our [List Event Subscriptions](https://docs.payroc.com/api/schema/notifications/event-subscriptions/list) method to search for the subscription.  

You can update the following properties of an event subscription:  
- **eventTypes** - Subscribe to new events or remove events that you are subscribed to.  
- **notifications** - Information about your endpoint and who we email if we can't contact your endpoint.  
- **enabled** - Turn on or turn off notifications for the subscription.  
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.notifications.event_subscriptions.partially_update(
  subscription_id: 1,
  idempotency_key: '8e03978e-40d5-43e8-bc93-6894a57f9324',
  request: []
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**subscription_id:** `Integer` 

Unique identifier that we assigned to the event subscription.  
**Note:** Our gateway returned the subscriptionId in the id field in the response of the [Create Event Subscription](https://docs.payroc.com/api/schema/notifications/event-subscriptions/create) method.  
    
</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String` — Unique identifier that you generate for each request. You must use the [UUID v4 format](https://www.rfc-editor.org/rfc/rfc4122) for the identifier. For more information about the idempotency key, go to [Idempotency](https://docs.payroc.com/api/idempotency).
    
</dd>
</dl>

<dl>
<dd>

**request:** `Internal::Types::Array[Payroc::Types::PatchDocument]` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::Notifications::EventSubscriptions::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## PaymentFeatures Cards
<details><summary><code>client.payment_features.cards.<a href="/lib/payroc/payment_features/cards/client.rb">verify_card</a>(request) -> Payroc::Types::CardVerificationResult</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to verify a customer’s card details.  

In the request, send the customer’s card details.  

In the response, our gateway indicates if the card details are valid and if you should use them in follow-on actions.  
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.payment_features.cards.verify_card(
  idempotency_key: '8e03978e-40d5-43e8-bc93-6894a57f9324',
  processing_terminal_id: '1234001',
  operator: 'Jane'
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**idempotency_key:** `String` — Unique identifier that you generate for each request. You must use the [UUID v4 format](https://www.rfc-editor.org/rfc/rfc4122) for the identifier. For more information about the idempotency key, go to [Idempotency](https://docs.payroc.com/api/idempotency).
    
</dd>
</dl>

<dl>
<dd>

**processing_terminal_id:** `String` — Unique identifier that we assigned to the terminal.
    
</dd>
</dl>

<dl>
<dd>

**operator:** `String` — Operator who requested to verify the card.
    
</dd>
</dl>

<dl>
<dd>

**customer:** `Payroc::Types::Customer` 
    
</dd>
</dl>

<dl>
<dd>

**card:** `Payroc::PaymentFeatures::Cards::Types::CardVerificationRequestCard` — Polymorphic object that contains payment details.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::PaymentFeatures::Cards::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.payment_features.cards.<a href="/lib/payroc/payment_features/cards/client.rb">view_ebt_balance</a>(request) -> Payroc::Types::Balance</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to view the balance of an Electronic Benefit Transfer (EBT) card.  

If the request is successful, our gateway returns the current balance of an EBT card. 
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.payment_features.cards.view_ebt_balance(
  processing_terminal_id: '1234001',
  operator: 'Jane',
  currency: 'USD'
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**processing_terminal_id:** `String` — Unique identifier that we assigned to the terminal.
    
</dd>
</dl>

<dl>
<dd>

**operator:** `String` — Operator who requested the balance inquiry.
    
</dd>
</dl>

<dl>
<dd>

**currency:** `Payroc::Types::Currency` 
    
</dd>
</dl>

<dl>
<dd>

**customer:** `Payroc::Types::Customer` 
    
</dd>
</dl>

<dl>
<dd>

**card:** `Payroc::PaymentFeatures::Cards::Types::BalanceInquiryCard` 

Polymorphic object that contains payment details.  

The value of the type parameter determines which variant you should use:  
-	`card` - Payment card details
-	`singleUseToken` - Single-use token details
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::PaymentFeatures::Cards::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.payment_features.cards.<a href="/lib/payroc/payment_features/cards/client.rb">lookup_bin</a>(request) -> Payroc::Types::CardInfo</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to retrieve information about a debit card, a credit card, or an EBT card. If you apply surcharges to transactions, you can also check if the card supports surcharging.  

In the response, our gateway returns the following information about the card:  

- **Card details** - Information about the card, for example, the issuing bank and the masked card number.  

- **Surcharging information** - If you apply a surcharge to transactions, our gateway checks that the card supports surcharging and returns information about the surcharge. For more information about surcharging, go to [Credit card surcharging](https://docs.payroc.com/knowledge/card-payments/credit-card-surcharging). 
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.payment_features.cards.lookup_bin(processing_terminal_id: '1234001');
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**processing_terminal_id:** `String` — Unique identifier that we assigned to the terminal.
    
</dd>
</dl>

<dl>
<dd>

**amount:** `Integer` — Transaction amount that you send to check the surcharge amount. The value is in the currency's lowest denomination, for example, cents.
    
</dd>
</dl>

<dl>
<dd>

**currency:** `Payroc::Types::Currency` 
    
</dd>
</dl>

<dl>
<dd>

**card:** `Payroc::PaymentFeatures::Cards::Types::BinLookupCard` 

Polymorphic object that contains payment details.  

The value of the type parameter determines which variant you should use:  
-	`card` - Payment card details
-	`cardBin` - Bank identification number (BIN) of the payment card
-	`secureToken` - Secure token details
-	`digitalWallet` - Digital wallet details
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::PaymentFeatures::Cards::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.payment_features.cards.<a href="/lib/payroc/payment_features/cards/client.rb">retrieve_fx_rates</a>(request) -> Payroc::Types::FxRate</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

> **Important:** There are restrictions on which merchants can use this method. For more information, go to [Dynamic Currency Conversion](https://docs.payroc.com/knowledge/card-payments/dynamic-currency-conversion).  

Use this method to check if a card is eligible for Dynamic Currency Conversion (DCC) and to retrieve the conversion rate for a transaction amount. DCC provides a customer with the option to use their card's currency instead of the merchant's currency, for example, in Ireland, an American customer can pay in US dollars instead of Euros.  

The request includes the following:  

- **Payment method** - Card information, a secure token, or digital wallet.  
- **Transaction information** - Amount and currency of the transaction in the merchant's currency.  

If the card is eligible for DCC, our gateway returns the transaction amount in the card's currency and a dccOffer object that contains information about the conversion rate. The dccOffer object contains the following fields that you need when you [run a sale](https://docs.payroc.com/api/schema/card-payments/payments/create) or [unreferenced refund](https://docs.payroc.com/api/schema/card-payments/refunds/create-unreferenced-refund) with DCC:  
- fxAmount  
- fxCurrency  
- fxRate  
- markup  
- accepted  
- offerReference  
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.payment_features.cards.retrieve_fx_rates(
  channel: 'web',
  processing_terminal_id: '1234001',
  operator: 'Jane',
  base_amount: 10000,
  base_currency: 'USD'
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**channel:** `Payroc::PaymentFeatures::Cards::Types::FxRateInquiryChannel` — Channel that the merchant used to receive payment details for the transaction.
    
</dd>
</dl>

<dl>
<dd>

**processing_terminal_id:** `String` — Unique identifier that we assigned to the terminal.
    
</dd>
</dl>

<dl>
<dd>

**operator:** `String` — Operator who ran the transaction.
    
</dd>
</dl>

<dl>
<dd>

**base_amount:** `Integer` — Total amount of the transaction in the merchant’s currency. The value is in the currency’s lowest denomination, for example, cents.
    
</dd>
</dl>

<dl>
<dd>

**base_currency:** `Payroc::Types::Currency` 
    
</dd>
</dl>

<dl>
<dd>

**payment_method:** `Payroc::PaymentFeatures::Cards::Types::FxRateInquiryPaymentMethod` 

Polymorphic object that contains payment details.  

The value of the type parameter determines which variant you should use:  
-	`card` - Payment card details
-	`secureToken` - Secure token details
-	`digitalWallet` - Digital wallet details
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::PaymentFeatures::Cards::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## PaymentFeatures Bank
<details><summary><code>client.payment_features.bank.<a href="/lib/payroc/payment_features/bank/client.rb">verify</a>(request) -> Payroc::Types::BankAccountVerificationResult</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to verify a customer's bank account details.  

In the request, send the customer's bank account details. Our gateway can verify the following types of bank details:  
- Automated Clearing House (ACH) details  
- Pre-Authorized Debit (PAD) details  

In the response, our gateway indicates if the account details are valid and if you should use them in follow-on actions.  
  
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.payment_features.bank.verify(
  idempotency_key: '8e03978e-40d5-43e8-bc93-6894a57f9324',
  processing_terminal_id: '1234001'
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**idempotency_key:** `String` — Unique identifier that you generate for each request. You must use the [UUID v4 format](https://www.rfc-editor.org/rfc/rfc4122) for the identifier. For more information about the idempotency key, go to [Idempotency](https://docs.payroc.com/api/idempotency).
    
</dd>
</dl>

<dl>
<dd>

**processing_terminal_id:** `String` — Unique identifier that we assigned to the terminal.
    
</dd>
</dl>

<dl>
<dd>

**bank_account:** `Payroc::PaymentFeatures::Bank::Types::BankAccountVerificationRequestBankAccount` 

Polymorphic object that contains bank account information.  

The value of the type field determines which variant you should use:  
-	`ach` - Automated Clearing House (ACH) details
-	`pad` - Pre-authorized debit (PAD) details
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::PaymentFeatures::Bank::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## PaymentLinks SharingEvents
<details><summary><code>client.payment_links.sharing_events.<a href="/lib/payroc/payment_links/sharing_events/client.rb">list</a>(payment_link_id) -> Payroc::Types::SharingEventPaginatedList</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to return a [paginated](https://docs.payroc.com/api/pagination) list of sharing events for a payment link. A sharing event occurs when a merchant shares a payment link with a customer.  

To list the sharing events for a payment link, you need its paymentLinkId. Our gateway returned the paymentLinkId in the response of the [Create Payment Link](https://docs.payroc.com/api/schema/payment-links/create) method.  

**Note:** If you don't have the paymentLinkId, use our [List Payment Links](https://docs.payroc.com/api/schema/payment-links/list) method to search for the payment link.  

Use query parameters to filter the list of results that we return, for example, to search for links sent to a specific customer.  

Our gateway returns the following information for each sharing event in the list:  
- Customer that the merchant sent the link to.  
- Date that the merchant sent the link.  
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.payment_links.sharing_events.list(
  payment_link_id: 'JZURRJBUPS',
  recipient_name: 'Sarah Hazel Hopper',
  recipient_email: 'sarah.hopper@example.com',
  before: '2571',
  after: '8516',
  limit: 1
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**payment_link_id:** `String` — Unique identifier that we assigned to the payment link.
    
</dd>
</dl>

<dl>
<dd>

**recipient_name:** `String` — Filter results by the customer's name.
    
</dd>
</dl>

<dl>
<dd>

**recipient_email:** `String` — Filter results by the customer's email address.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String` 

Return the previous page of results before the value that you specify.  

You can’t send the before parameter in the same request as the after parameter. 
    
</dd>
</dl>

<dl>
<dd>

**after:** `String` 

Return the next page of results after the value that you specify.  

You can’t send the after parameter in the same request as the before parameter. 
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` — Limit the maximum number of results that we return for each page.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::PaymentLinks::SharingEvents::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.payment_links.sharing_events.<a href="/lib/payroc/payment_links/sharing_events/client.rb">share</a>(payment_link_id, request) -> Payroc::Types::PaymentLinkEmailShareEvent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to email a payment link to a customer.  

To email a payment link, you need its paymentLinkId. Our gateway returned the paymentLinkId in the response of the [Create Payment Link](https://docs.payroc.com/api/schema/payment-links/create) method.  

**Note:** If you don't have the paymentLinkId, use our [List Payment Links](https://docs.payroc.com/api/schema/payment-links/list) method to search for the payment link.  

In the request, you must provide the recipient's name and email address.  

In the response, our gateway returns a sharingEventId, which you can use to [List Payment Link Sharing Events](https://docs.payroc.com/api/schema/payment-links/sharing-events/list).  
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.payment_links.sharing_events.share(
  payment_link_id: 'JZURRJBUPS',
  idempotency_key: '8e03978e-40d5-43e8-bc93-6894a57f9324',
  sharing_method: 'email',
  merchant_copy: true,
  message: 'Dear Sarah,
  
  Your insurance is expiring this month.
  Please, pay the renewal fee by the end of the month to renew it.
  ',
  recipients: [{
    name: 'Sarah Hazel Hopper',
    email: 'sarah.hopper@example.com'
  }]
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**payment_link_id:** `String` — Unique identifier that we assigned to the payment link.
    
</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String` — Unique identifier that you generate for each request. You must use the [UUID v4 format](https://www.rfc-editor.org/rfc/rfc4122) for the identifier. For more information about the idempotency key, go to [Idempotency](https://docs.payroc.com/api/idempotency).
    
</dd>
</dl>

<dl>
<dd>

**request:** `Payroc::Types::PaymentLinkEmailShareEvent` — Polymorphic object that contains information about how to share a payment link.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::PaymentLinks::SharingEvents::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## PayrocCloud PaymentInstructions
<details><summary><code>client.payroc_cloud.payment_instructions.<a href="/lib/payroc/payroc_cloud/payment_instructions/client.rb">submit</a>(serial_number, request) -> Payroc::Types::PaymentInstruction</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to submit an instruction request to initiate a sale on a payment device.  

In the request, include the order amount and currency.  

When you send a successful request, our gateway returns information about the payment instruction and a paymentInstructionId, which you need for the following methods:
- [Retrieve payment instruction](https://docs.payroc.com/api/schema/payroc-cloud/payment-instructions/retrieve) - View the details of the payment instruction.
- [Cancel payment instruction](https://docs.payroc.com/api/schema/payroc-cloud/payment-instructions/delete) - Cancel the payment instruction.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.payroc_cloud.payment_instructions.submit(
  serial_number: '1850010868',
  idempotency_key: '8e03978e-40d5-43e8-bc93-6894a57f9324',
  operator: 'Jane',
  processing_terminal_id: '1234001',
  order: {
    order_id: 'OrderRef6543',
    amount: 4999,
    currency: 'USD'
  },
  customization_options: {
    entry_method: 'deviceRead'
  },
  auto_capture: true
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**serial_number:** `String` — Serial number of the merchant’s payment device.
    
</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String` — Unique identifier that you generate for each request. You must use the [UUID v4 format](https://www.rfc-editor.org/rfc/rfc4122) for the identifier. For more information about the idempotency key, go to [Idempotency](https://docs.payroc.com/api/idempotency).
    
</dd>
</dl>

<dl>
<dd>

**operator:** `String` — Operator who initiated the request.
    
</dd>
</dl>

<dl>
<dd>

**processing_terminal_id:** `String` — Unique identifier that we assigned to the terminal.
    
</dd>
</dl>

<dl>
<dd>

**order:** `Payroc::Types::PaymentInstructionOrder` 
    
</dd>
</dl>

<dl>
<dd>

**customer:** `Payroc::Types::Customer` 
    
</dd>
</dl>

<dl>
<dd>

**ip_address:** `Payroc::Types::IpAddress` 
    
</dd>
</dl>

<dl>
<dd>

**credential_on_file:** `Payroc::Types::SchemasCredentialOnFile` 
    
</dd>
</dl>

<dl>
<dd>

**customization_options:** `Payroc::Types::CustomizationOptions` 
    
</dd>
</dl>

<dl>
<dd>

**auto_capture:** `Internal::Types::Boolean` 

Indicates if we should automatically capture the payment amount.  

- `true` - Run a sale and automatically capture the transaction.
- `false`- Run a pre-authorization and capture the transaction later.  

**Note:** If you send `false` and the terminal doesn't support pre-authorization, we set the transaction's status to pending. The merchant must capture the transaction to take payment from the customer.
    
</dd>
</dl>

<dl>
<dd>

**process_as_sale:** `Internal::Types::Boolean` 

Indicates if we should immediately settle the sale transaction. The merchant cannot adjust the transaction if we immediately settle it.  
**Note:** If the value for **processAsSale** is `true`, the gateway ignores the value in **autoCapture**.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::PayrocCloud::PaymentInstructions::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.payroc_cloud.payment_instructions.<a href="/lib/payroc/payroc_cloud/payment_instructions/client.rb">retrieve</a>(payment_instruction_id) -> Payroc::Types::PaymentInstruction</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to retrieve information about a payment instruction.  

To retrieve a payment instruction, you need its paymentInstructionId. Our gateway returned the paymentInstructionId in the response of the [Submit Payment Instruction](https://docs.payroc.com/api/schema/payroc-cloud/payment-instructions/submit) method.  

Our gateway returns the status of the payment instruction. If the payment device completed the payment instruction, the response also includes a link to the payment.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.payroc_cloud.payment_instructions.retrieve(payment_instruction_id: 'e743a9165d134678a9100ebba3b29597');
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**payment_instruction_id:** `String` — Unique identifier that we assigned to the payment instruction.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::PayrocCloud::PaymentInstructions::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.payroc_cloud.payment_instructions.<a href="/lib/payroc/payroc_cloud/payment_instructions/client.rb">delete</a>(payment_instruction_id) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to cancel a payment instruction.  

You can cancel a payment instruction only if its status is `inProgress`. To retrieve the status of a payment instruction, use our [Retrieve Payment Instruction](https://docs.payroc.com/api/schema/payroc-cloud/payment-instructions/retrieve) method.  

To cancel a payment instruction, you need its paymentInstructionId. Our gateway returned the paymentInstructionId in the response of the [Submit Payment Instruction](https://docs.payroc.com/api/schema/payroc-cloud/payment-instructions/submit) method.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.payroc_cloud.payment_instructions.delete(payment_instruction_id: 'e743a9165d134678a9100ebba3b29597');
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**payment_instruction_id:** `String` — Unique identifier that we assigned to the payment instruction.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::PayrocCloud::PaymentInstructions::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## PayrocCloud RefundInstructions
<details><summary><code>client.payroc_cloud.refund_instructions.<a href="/lib/payroc/payroc_cloud/refund_instructions/client.rb">submit</a>(serial_number, request) -> Payroc::Types::RefundInstruction</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to submit an instruction request to initiate a refund on a payment device.  

In the request, include the refund amount and currency.  

If the request is successful, our gateway returns information about the refund instruction and a refundInstructionId, which you need for the following methods:
- [Retrieve refund instruction](https://docs.payroc.com/api/schema/payroc-cloud/refund-instructions/retrieve) - View the details of the refund instruction.
- [Cancel refund instruction](https://docs.payroc.com/api/schema/payroc-cloud/refund-instructions/delete) - Cancel the refund instruction.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.payroc_cloud.refund_instructions.submit(
  serial_number: '1850010868',
  idempotency_key: '8e03978e-40d5-43e8-bc93-6894a57f9324',
  operator: 'Jane',
  processing_terminal_id: '1234001',
  order: {
    order_id: 'OrderRef6543',
    description: 'Refund for order OrderRef6543',
    amount: 4999,
    currency: 'USD'
  },
  customization_options: {
    entry_method: 'manualEntry'
  }
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**serial_number:** `String` — Serial number that identifies the merchant’s payment device.
    
</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String` — Unique identifier that you generate for each request. You must use the [UUID v4 format](https://www.rfc-editor.org/rfc/rfc4122) for the identifier. For more information about the idempotency key, go to [Idempotency](https://docs.payroc.com/api/idempotency).
    
</dd>
</dl>

<dl>
<dd>

**operator:** `String` — Operator who initiated the request.
    
</dd>
</dl>

<dl>
<dd>

**processing_terminal_id:** `String` — Unique identifier that we assigned to the terminal.
    
</dd>
</dl>

<dl>
<dd>

**order:** `Payroc::Types::RefundInstructionOrder` 
    
</dd>
</dl>

<dl>
<dd>

**customer:** `Payroc::Types::Customer` 
    
</dd>
</dl>

<dl>
<dd>

**ip_address:** `Payroc::Types::IpAddress` 
    
</dd>
</dl>

<dl>
<dd>

**customization_options:** `Payroc::Types::CustomizationOptions` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::PayrocCloud::RefundInstructions::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.payroc_cloud.refund_instructions.<a href="/lib/payroc/payroc_cloud/refund_instructions/client.rb">retrieve</a>(refund_instruction_id) -> Payroc::Types::RefundInstruction</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to retrieve information about a refund instruction.  

To retrieve a refund instruction, you need its refundInstructionId. Our gateway returned the refundInstructionId in the response of the [Submit Refund Instruction](https://docs.payroc.com/api/schema/payroc-cloud/refund-instructions/submit) method.  

Our gateway returns the status of the refund instruction. If the payment device completed the refund instruction, the response also includes a link to the refund.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.payroc_cloud.refund_instructions.retrieve(refund_instruction_id: 'a37439165d134678a9100ebba3b29597');
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**refund_instruction_id:** `String` — Unique identifier that we assigned to the refund instruction.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::PayrocCloud::RefundInstructions::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.payroc_cloud.refund_instructions.<a href="/lib/payroc/payroc_cloud/refund_instructions/client.rb">delete</a>(refund_instruction_id) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to cancel a refund instruction.  

You can cancel a refund instruction only if its status is `inProgress`. To retrieve the status of a refund instruction, use our [Retrieve Refund Instruction](https://docs.payroc.com/api/schema/payroc-cloud/refund-instructions/retrieve) method.  

To cancel a refund instruction, you need its refundInstructionId. Our gateway returned the refundInstructionId in the response of the [Submit Refund Instruction](https://docs.payroc.com/api/schema/payroc-cloud/refund-instructions/submit) method. 
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.payroc_cloud.refund_instructions.delete(refund_instruction_id: 'a37439165d134678a9100ebba3b29597');
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**refund_instruction_id:** `String` — Unique identifier that we assigned to the refund instruction.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::PayrocCloud::RefundInstructions::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## PayrocCloud SignatureInstructions
<details><summary><code>client.payroc_cloud.signature_instructions.<a href="/lib/payroc/payroc_cloud/signature_instructions/client.rb">submit</a>(serial_number, request) -> Payroc::Types::SignatureInstruction</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to submit an instruction to capture a customer's signature on a payment device.  

Our gateway returns information about the signature instruction and a signatureInstructionId, which you need for the following methods:
- [Retrieve signature instruction](https://docs.payroc.com/api/schema/payroc-cloud/signature-instructions/retrieve) - View the details of the signature instruction.
- [Cancel signature instruction](https://docs.payroc.com/api/schema/payroc-cloud/signature-instructions/delete) - Cancel the signature instruction.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.payroc_cloud.signature_instructions.submit(
  serial_number: '1850010868',
  idempotency_key: '8e03978e-40d5-43e8-bc93-6894a57f9324',
  processing_terminal_id: '1234001'
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**serial_number:** `String` — Serial number that identifies the merchant’s payment device.
    
</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String` — Unique identifier that you generate for each request. You must use the [UUID v4 format](https://www.rfc-editor.org/rfc/rfc4122) for the identifier. For more information about the idempotency key, go to [Idempotency](https://docs.payroc.com/api/idempotency).
    
</dd>
</dl>

<dl>
<dd>

**processing_terminal_id:** `String` — Unique identifier that we assigned to the terminal.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::PayrocCloud::SignatureInstructions::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.payroc_cloud.signature_instructions.<a href="/lib/payroc/payroc_cloud/signature_instructions/client.rb">retrieve</a>(signature_instruction_id) -> Payroc::Types::SignatureInstruction</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to retrieve information about a signature instruction.  

To retrieve a signature instruction, you need its signatureInstructionId. Our gateway returned the signatureInstructionId in the response of the [Submit Signature Instruction](https://docs.payroc.com/api/schema/payroc-cloud/signature-instructions/submit) method.  

Our gateway returns the status of the instruction. If the payment device completed the instruction, the response also includes a link to retrieve the signature.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.payroc_cloud.signature_instructions.retrieve(signature_instruction_id: 'a37439165d134678a9100ebba3b29597');
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**signature_instruction_id:** `String` — Unique identifier that our gateway assigned to the signature instruction.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::PayrocCloud::SignatureInstructions::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.payroc_cloud.signature_instructions.<a href="/lib/payroc/payroc_cloud/signature_instructions/client.rb">delete</a>(signature_instruction_id) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to cancel a signature instruction.  

To cancel a signature instruction, you need its signatureInstructionId. Our gateway returned the signatureInstructionId in the response of the [Submit signature instruction](https://docs.payroc.com/api/schema/payroc-cloud/signature-instructions/submit) method.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.payroc_cloud.signature_instructions.delete(signature_instruction_id: 'a37439165d134678a9100ebba3b29597');
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**signature_instruction_id:** `String` — Unique identifier that our gateway assigned to the signature instruction.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::PayrocCloud::SignatureInstructions::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## PayrocCloud Signatures
<details><summary><code>client.payroc_cloud.signatures.<a href="/lib/payroc/payroc_cloud/signatures/client.rb">retrieve</a>(signature_id) -> Payroc::PayrocCloud::Signatures::Types::RetrieveSignaturesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to retrieve a signature that a payment device captured using Payroc Cloud. 

Our gateway returns the following information about the signature:
- Image of the signature
- Format of the image
- Date that the device captured the image
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.payroc_cloud.signatures.retrieve(signature_id: 'JDN4ILZB0T');
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**signature_id:** `String` — Unique identifier that we assigned to the signature.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::PayrocCloud::Signatures::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## RepeatPayments PaymentPlans
<details><summary><code>client.repeat_payments.payment_plans.<a href="/lib/payroc/repeat_payments/payment_plans/client.rb">list</a>(processing_terminal_id) -> Payroc::Types::PaymentPlanPaginatedList</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to return a [paginated](https://docs.payroc.com/api/pagination) list of payment plans for a processing terminal.  

**Note:** If you want to view the details of a specific payment plan and you have its paymentPlanId, use our [Retrieve Payment Plan](https://docs.payroc.com/api/schema/repeat-payments/payment-plans/retrieve) method.  

Our gateway returns the following information about each payment plan in the list:  

  -	Name, length, and currency of the plan  
  -	How often our gateway collects each payment  
  -	How much our gateway collects for each payment  
  -	What happens if the merchant updates or deletes the plan  

For each payment plan, we return the paymentPlanId, which you can use to perform follow-on actions.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.repeat_payments.payment_plans.list(
  processing_terminal_id: '1234001',
  before: '2571',
  after: '8516',
  limit: 1
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**processing_terminal_id:** `String` — Unique identifier that we assigned to the terminal.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String` 

Return the previous page of results before the value that you specify.  

You can’t send the before parameter in the same request as the after parameter. 
    
</dd>
</dl>

<dl>
<dd>

**after:** `String` 

Return the next page of results after the value that you specify.  

You can’t send the after parameter in the same request as the before parameter. 
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` — Limit the maximum number of results that we return for each page.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::RepeatPayments::PaymentPlans::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.repeat_payments.payment_plans.<a href="/lib/payroc/repeat_payments/payment_plans/client.rb">create</a>(processing_terminal_id, request) -> Payroc::Types::PaymentPlan</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to create a payment schedule that you can assign customers to.  

**Note:** This method is part of our Repeat Payments feature. To help you understand how this method works with our Subscriptions endpoints, go to [Repeat Payments](https://docs.payroc.com/guides/take-payments/repeat-payments).  

When you create a payment plan you need to provide a unique paymentPlanId that you use to run follow-on actions:  

-	[Retrieve Payment Plan](https://docs.payroc.com/api/schema/repeat-payments/payment-plans/retrieve)  - View the details of the payment plan.  
-	[Update Payment Plan](https://docs.payroc.com/api/schema/repeat-payments/payment-plans/partially-update)  - Update the details of the payment plan.  
-	[Delete Payment Plan](https://docs.payroc.com/api/schema/repeat-payments/payment-plans/delete)  - Delete the payment plan.  
-	[Create Subscription](https://docs.payroc.com/api/schema/repeat-payments/subscriptions/create)  - Subscribe a customer to the payment plan.  

The request includes the following settings:  

-	**type** - Indicates if our gateway or the merchant collects payments. If the merchant manually collects payments, integrate with the [Pay Manual Subscription](https://docs.payroc.com/api/schema/repeat-payments/subscriptions/pay) method.  
-	**recurringOrder** - Amount of each payment if the gateway automatically collect payments.  
-	**setupOrder** - Setup fee that our gateway immediately collects from the customer's payment method.  
-	**onUpdate and onDelete** - Indicates what happens to associated subscriptions if the merchant updates or deletes the payment plan.  
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.repeat_payments.payment_plans.create(
  processing_terminal_id: '1234001',
  idempotency_key: '8e03978e-40d5-43e8-bc93-6894a57f9324',
  payment_plan_id: 'PlanRef8765',
  name: 'Premium Club',
  description: 'Monthly Premium Club subscription',
  currency: 'USD',
  length: 12,
  type: 'automatic',
  frequency: 'monthly',
  on_update: 'continue',
  on_delete: 'complete',
  custom_field_names: ['yourCustomField'],
  setup_order: {
    amount: 4999,
    description: 'Initial setup fee for Premium Club subscription',
    breakdown: {
      subtotal: 4347,
      taxes: [{
        name: 'Sales Tax',
        rate: 5
      }]
    }
  },
  recurring_order: {
    amount: 4999,
    description: 'Monthly Premium Club subscription',
    breakdown: {
      subtotal: 4347,
      taxes: [{
        name: 'Sales Tax',
        rate: 5
      }]
    }
  }
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**processing_terminal_id:** `String` — Unique identifier that we assigned to the terminal.
    
</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String` — Unique identifier that you generate for each request. You must use the [UUID v4 format](https://www.rfc-editor.org/rfc/rfc4122) for the identifier. For more information about the idempotency key, go to [Idempotency](https://docs.payroc.com/api/idempotency).
    
</dd>
</dl>

<dl>
<dd>

**request:** `Payroc::Types::PaymentPlan` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::RepeatPayments::PaymentPlans::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.repeat_payments.payment_plans.<a href="/lib/payroc/repeat_payments/payment_plans/client.rb">retrieve</a>(processing_terminal_id, payment_plan_id) -> Payroc::Types::PaymentPlan</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to retrieve information about a payment plan.  

To retrieve a payment plan, you need its paymentPlanId. Our gateway returned the paymentPlanId in the response of the [Create Payment Plan](https://docs.payroc.com/api/schema/repeat-payments/payment-plans/create) method.  

**Note:** If you don't have the paymentPlanId, use our [List Payment Plans](https://docs.payroc.com/api/schema/repeat-payments/payment-plans/list) method to search for the payment plan.  

Our gateway returns the following information about the payment plan:  

  -	Name, length, and currency of the plan  
  -	How often our gateway collects each payment  
  -	How much our gateway collects for each payment  
  -	What happens if the merchant updates or deletes the plan  
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.repeat_payments.payment_plans.retrieve(
  processing_terminal_id: '1234001',
  payment_plan_id: 'PlanRef8765'
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**processing_terminal_id:** `String` — Unique identifier that we assigned to the terminal.
    
</dd>
</dl>

<dl>
<dd>

**payment_plan_id:** `String` — Unique identifier that the merchant assigned to the payment plan.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::RepeatPayments::PaymentPlans::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.repeat_payments.payment_plans.<a href="/lib/payroc/repeat_payments/payment_plans/client.rb">delete</a>(processing_terminal_id, payment_plan_id) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to delete a payment plan.  

> **Important:** When you delete a payment plan, you can’t recover it. You also won’t be able to add subscriptions to the payment plan.  

To delete a payment plan, you need its paymentPlanId, which you sent in the request of the [Create Payment Plan](https://docs.payroc.com/api/schema/repeat-payments/payment-plans/create) method.  

**Note:** If you don't have the paymentPlanId, use our [List Payment Plans](https://docs.payroc.com/api/schema/repeat-payments/payment-plans/list) method to search for the payment plan.  

The value you sent for the onDelete parameter when you created the payment plan indicates what happens to associated subscriptions when you delete the plan:  

  -	`complete` - Our gateway stops taking payments for the subscriptions associated with the payment plan.  
  -	`continue` - Our gateway continues to take payments for the subscriptions associated with the payment plan. To stop a subscription for a cancelled payment plan, go to the [Deactivate Subscription](https://docs.payroc.com/api/schema/repeat-payments/subscriptions/deactivate) method.  
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.repeat_payments.payment_plans.delete(
  processing_terminal_id: '1234001',
  payment_plan_id: 'PlanRef8765'
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**processing_terminal_id:** `String` — Unique identifier that we assigned to the terminal.
    
</dd>
</dl>

<dl>
<dd>

**payment_plan_id:** `String` — Unique identifier that the merchant assigned to the payment plan.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::RepeatPayments::PaymentPlans::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.repeat_payments.payment_plans.<a href="/lib/payroc/repeat_payments/payment_plans/client.rb">partially_update</a>(processing_terminal_id, payment_plan_id, request) -> Payroc::Types::PaymentPlan</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to partially update a payment plan. Structure your request to follow the [RFC 6902](https://datatracker.ietf.org/doc/html/rfc6902) standard.  

To update a payment plan, you need its paymentPlanId, which you sent in the request of the [Create Payment Plan](https://docs.payroc.com/api/schema/repeat-payments/payment-plans/create) method.  

**Note:** If you don't have the paymentPlanId, use our [List Payment Plans](https://docs.payroc.com/api/schema/repeat-payments/payment-plans/list) method to search for the payment plan.  

You can update all of the properties of the payment plan except for the paymentPlanId.  

The value you sent for the onUpdate parameter when you created the payment plan indicates what happens to the associated subscriptions when you update the plan:  
- `update` - Our gateway updates the subscriptions associated with the payment plan.
- `continue` - Our  gateway doesn't update the subscriptions associated with the payment plan.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.repeat_payments.payment_plans.partially_update(
  processing_terminal_id: '1234001',
  payment_plan_id: 'PlanRef8765',
  idempotency_key: '8e03978e-40d5-43e8-bc93-6894a57f9324',
  request: []
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**processing_terminal_id:** `String` — Unique identifier that we assigned to the terminal.
    
</dd>
</dl>

<dl>
<dd>

**payment_plan_id:** `String` — Unique identifier that the merchant assigned to the payment plan.
    
</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String` — Unique identifier that you generate for each request. You must use the [UUID v4 format](https://www.rfc-editor.org/rfc/rfc4122) for the identifier. For more information about the idempotency key, go to [Idempotency](https://docs.payroc.com/api/idempotency).
    
</dd>
</dl>

<dl>
<dd>

**request:** `Internal::Types::Array[Payroc::Types::PatchDocument]` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::RepeatPayments::PaymentPlans::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## RepeatPayments Subscriptions
<details><summary><code>client.repeat_payments.subscriptions.<a href="/lib/payroc/repeat_payments/subscriptions/client.rb">list</a>(processing_terminal_id) -> Payroc::Types::SubscriptionPaginatedList</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to return a [paginated](https://docs.payroc.com/api/pagination) list of subscriptions.  

Note: If you want to view the details of a specific subscription and you have its subscriptionId, use our [Retrieve subscription](https://docs.payroc.com/api/schema/repeat-payments/subscriptions/retrieve) method.  

Use query parameters to filter the list of results that we return, for example, to search for subscriptions for a customer, a payment plan, or frequency.  

Our gateway returns information about the following for each subscription in the list:  

-	Payment plan the subscription is linked to.  
-	Secure token that represents cardholder’s payment details.  
-	Current state of the subscription, including its status, next due date, and invoices.  
-	Fees for setup and the cost of the recurring order.  
-	Subscription length, end date, and frequency.  

For each subscription, we also return the subscriptionId, the paymentPlanId, and the secureTokenId, which you can use to perform follow-actions. 
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.repeat_payments.subscriptions.list(
  processing_terminal_id: '1234001',
  customer_name: 'Sarah%20Hazel%20Hopper',
  last_4: '7062',
  payment_plan: 'Premium%20Club',
  frequency: 'weekly',
  status: 'active',
  end_date: '2025-07-01',
  next_due_date: '2024-08-01',
  before: '2571',
  after: '8516',
  limit: 1
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**processing_terminal_id:** `String` — Unique identifier that we assigned to the terminal.
    
</dd>
</dl>

<dl>
<dd>

**customer_name:** `String` — Filter by the customer's name.
    
</dd>
</dl>

<dl>
<dd>

**last_4:** `String` — Filter by the last four digits of the card or account number.
    
</dd>
</dl>

<dl>
<dd>

**payment_plan:** `String` — Filter by the name of the payment plan.
    
</dd>
</dl>

<dl>
<dd>

**frequency:** `Payroc::RepeatPayments::Subscriptions::Types::ListSubscriptionsRequestFrequency` — Filter by the frequency of subscription payments.
    
</dd>
</dl>

<dl>
<dd>

**status:** `Payroc::RepeatPayments::Subscriptions::Types::ListSubscriptionsRequestStatus` — Filter by the current status of the subscription.
    
</dd>
</dl>

<dl>
<dd>

**end_date:** `String` 

Format: `YYYY-MM-DD`  
Filter subscriptions that end on a specific date.
    
</dd>
</dl>

<dl>
<dd>

**next_due_date:** `String` 

Format: `YYYY-MM-DD`  
Filter subscriptions by the date that the next payment is collected.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String` 

Return the previous page of results before the value that you specify.  

You can’t send the before parameter in the same request as the after parameter. 
    
</dd>
</dl>

<dl>
<dd>

**after:** `String` 

Return the next page of results after the value that you specify.  

You can’t send the after parameter in the same request as the before parameter. 
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` — Limit the maximum number of results that we return for each page.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::RepeatPayments::Subscriptions::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.repeat_payments.subscriptions.<a href="/lib/payroc/repeat_payments/subscriptions/client.rb">create</a>(processing_terminal_id, request) -> Payroc::Types::Subscription</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to assign a customer to a payment plan.  

**Note:** This method is part of our Repeat Payments feature. To help you understand how this method works with our Payment plans endpoints, go to [Repeat Payments](https://docs.payroc.com/guides/take-payments/repeat-payments).  

When you create a subscription you need to provide a unique subscriptionId that you use to run follow-on actions:  

- [Retrieve Subscription](https://docs.payroc.com/api/schema/repeat-payments/subscriptions/retrieve) - View the details of the subscription.
- [Update Subscription](https://docs.payroc.com/api/schema/repeat-payments/subscriptions/partially-update) - Update the details of the subscription.
- [Deactivate Subscription](https://docs.payroc.com/api/schema/repeat-payments/subscriptions/deactivate) - Stop taking payments for the subscription.
- [Re-activate Subscription](https://docs.payroc.com/api/schema/payments/subscriptions/reactivate) - Start taking payments again for the subscription.
- [Pay Manual Subscription](https://docs.payroc.com/api/schema/repeat-payments/subscriptions/pay) - Manually collect a payment for the subscription.

The request includes the following settings:
- **paymentPlanId** - Unique identifier of the payment plan that the merchant wants to use. If you don't have the paymentPlanId, use our [List Payment Plans](https://docs.payroc.com/api/schema/repeat-payments/payment-plans/list) method to search for the payment plan.
- **paymentMethod** - Object that contains information about the secure token, which represents the customer's card details or bank account details.
- **startDate** - Date that you want to start to take payments.

You can also update the settings that the subscription inherited from the payment plan, for example, you can change the amount for each payment. If you change the settings for the subscription, it doesn't change the settings in the payment plan that it's linked to. 
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.repeat_payments.subscriptions.create(
  processing_terminal_id: '1234001',
  idempotency_key: '8e03978e-40d5-43e8-bc93-6894a57f9324',
  subscription_id: 'SubRef7654',
  payment_plan_id: 'PlanRef8765',
  name: 'Premium Club',
  description: 'Premium Club subscription',
  setup_order: {
    order_id: 'OrderRef6543',
    amount: 4999,
    description: 'Initial setup fee for Premium Club subscription'
  },
  recurring_order: {
    amount: 4999,
    description: 'Monthly Premium Club subscription',
    breakdown: {
      subtotal: 4347,
      taxes: [{
        type: 'rate',
        rate: 5,
        name: 'Sales Tax'
      }]
    }
  },
  start_date: '2024-07-02',
  end_date: '2025-07-01',
  length: 12,
  pause_collection_for: 0
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**processing_terminal_id:** `String` — Unique identifier that we assigned to the terminal.
    
</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String` — Unique identifier that you generate for each request. You must use the [UUID v4 format](https://www.rfc-editor.org/rfc/rfc4122) for the identifier. For more information about the idempotency key, go to [Idempotency](https://docs.payroc.com/api/idempotency).
    
</dd>
</dl>

<dl>
<dd>

**subscription_id:** `String` — Unique identifier that the merchant assigned to the subscription.
    
</dd>
</dl>

<dl>
<dd>

**payment_plan_id:** `String` — Unique identifier that the merchant assigned to the payment plan.
    
</dd>
</dl>

<dl>
<dd>

**payment_method:** `Payroc::RepeatPayments::Subscriptions::Types::SubscriptionRequestPaymentMethod` — Polymorphic object that contains information about the secure token.
    
</dd>
</dl>

<dl>
<dd>

**name:** `String` 

Name of the subscription. 
This value replaces the name inherited from the payment plan.
    
</dd>
</dl>

<dl>
<dd>

**description:** `String` 

Description of the subscription. 
This value replaces the description inherited from the payment plan.
    
</dd>
</dl>

<dl>
<dd>

**setup_order:** `Payroc::Types::SubscriptionPaymentOrderRequest` 
    
</dd>
</dl>

<dl>
<dd>

**recurring_order:** `Payroc::Types::SubscriptionRecurringOrderRequest` 
    
</dd>
</dl>

<dl>
<dd>

**start_date:** `String` 

Format: **YYYY-MM-DD**  
Subscription's start date.
    
</dd>
</dl>

<dl>
<dd>

**end_date:** `String` 

Format: **YYYY-MM-DD**  
Subscription's end date.  
**Note:** If you provide values for both **length** and **endDate**, 
our gateway uses the value for **endDate** to determine when the subscription should end.
    
</dd>
</dl>

<dl>
<dd>

**length:** `Integer` 

Total number of billing cycles. To indicate that the subscription should run indefinitely, send a value of `0`.
This value replaces the **length** inherited from the payment plan.  
**Note:** If you provide values for both **length** and **endDate**, 
our gateway uses the value for **endDate** to determine when the subscription should end.
    
</dd>
</dl>

<dl>
<dd>

**pause_collection_for:** `Integer` 

Number of billing cycles that the merchant wants to pause payments for. 
For example, if the merchant wants to offer a free trial period.
    
</dd>
</dl>

<dl>
<dd>

**custom_fields:** `Internal::Types::Array[Payroc::Types::CustomField]` — Array of customField objects.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::RepeatPayments::Subscriptions::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.repeat_payments.subscriptions.<a href="/lib/payroc/repeat_payments/subscriptions/client.rb">retrieve</a>(processing_terminal_id, subscription_id) -> Payroc::Types::Subscription</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to retrieve information about a subscription.  

To retrieve a subscription, you need its subscriptionId. You sent the subscriptionId in the request of the [Create subscription](https://docs.payroc.com/api/schema/repeat-payments/subscriptions/create) method.  

**Note:** If you don't have the subscriptionId, use our [List subscriptions](https://docs.payroc.com/api/schema/repeat-payments/subscriptions/list) method to search for the subscription.  

Our gateway returns information about the following for the subscription:  

-	Payment plan the subscription is linked to.  
-	Secure token that represents cardholder’s payment details.  
-	Current state of the subscription, including its status, next due date, and invoices.  
-	Fees for setup and the cost of the recurring order.  
-	Subscription length, end date, and frequency.  

We also return the paymentPlanId and the secureTokenId, which you can use to perform follow-on actions.  
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.repeat_payments.subscriptions.retrieve(
  processing_terminal_id: '1234001',
  subscription_id: 'SubRef7654'
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**processing_terminal_id:** `String` — Unique identifier that we assigned to the terminal.
    
</dd>
</dl>

<dl>
<dd>

**subscription_id:** `String` — Unique identifier that the merchant assigned to the subscription.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::RepeatPayments::Subscriptions::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.repeat_payments.subscriptions.<a href="/lib/payroc/repeat_payments/subscriptions/client.rb">partially_update</a>(processing_terminal_id, subscription_id, request) -> Payroc::Types::Subscription</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to partially update a subscription. Structure your request to follow the [RFC 6902](https://datatracker.ietf.org/doc/html/rfc6902) standard.  

To update a subscription, you need its subscriptionId, which you sent in the request of the [Create subscription](https://docs.payroc.com/api/schema/repeat-payments/subscriptions/create) method.  

**Note:** If you don't have the subscriptionId, use our [List subscriptions](https://docs.payroc.com/api/schema/repeat-payments/subscriptions/list) method to search for the payment.  

You can update all of the properties of the subscription except for the following:  

**Can't delete**  
- recurringOrder
- description
- name

**Can't perform any PATCH operation**  
- currentState
- type
- frequency
- paymentPlan
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.repeat_payments.subscriptions.partially_update(
  processing_terminal_id: '1234001',
  subscription_id: 'SubRef7654',
  idempotency_key: '8e03978e-40d5-43e8-bc93-6894a57f9324',
  request: []
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**processing_terminal_id:** `String` — Unique identifier that we assigned to the terminal.
    
</dd>
</dl>

<dl>
<dd>

**subscription_id:** `String` — Unique identifier that the merchant assigned to the subscription.
    
</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String` — Unique identifier that you generate for each request. You must use the [UUID v4 format](https://www.rfc-editor.org/rfc/rfc4122) for the identifier. For more information about the idempotency key, go to [Idempotency](https://docs.payroc.com/api/idempotency).
    
</dd>
</dl>

<dl>
<dd>

**request:** `Internal::Types::Array[Payroc::Types::PatchDocument]` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::RepeatPayments::Subscriptions::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.repeat_payments.subscriptions.<a href="/lib/payroc/repeat_payments/subscriptions/client.rb">deactivate</a>(processing_terminal_id, subscription_id) -> Payroc::Types::Subscription</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to deactivate a subscription.  

To deactivate a subscription, you need its subscriptionId, which you sent in the request of the [Create Subscription](https://docs.payroc.com/api/schema/repeat-payments/subscriptions/create) method.  

**Note:** If you don't have the subscriptionId, use our [List Subscriptions](https://docs.payroc.com/api/schema/repeat-payments/subscriptions/list) method to search for the subscription.  

If your request is successful, our gateway stops taking payments from the customer.  

To reactivate the subscription, use our [Reactivate Subscription](https://docs.payroc.com/api/schema/payments/subscriptions/reactivate) method.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.repeat_payments.subscriptions.deactivate(
  processing_terminal_id: '1234001',
  subscription_id: 'SubRef7654'
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**processing_terminal_id:** `String` — Unique identifier that we assigned to the terminal.
    
</dd>
</dl>

<dl>
<dd>

**subscription_id:** `String` — Unique identifier that the merchant assigned to the subscription.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::RepeatPayments::Subscriptions::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.repeat_payments.subscriptions.<a href="/lib/payroc/repeat_payments/subscriptions/client.rb">reactivate</a>(processing_terminal_id, subscription_id) -> Payroc::Types::Subscription</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to reactivate a subscription.  

To reactivate a subscription, you need its subscriptionId, which you sent in the request of the [Create Subscription](https://docs.payroc.com/api/schema/repeat-payments/subscriptions/create) method.  

**Note:** If you don't have the subscriptionId, use our [List Subscriptions](https://docs.payroc.com/api/schema/repeat-payments/subscriptions/list) method to search for the subscription.  

If your request is successful, our gateway restarts taking payments from the customer.  

To deactivate the subscription, use our [Deactivate Subscription](https://docs.payroc.com/api/schema/repeat-payments/subscriptions/deactivate) method.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.repeat_payments.subscriptions.reactivate(
  processing_terminal_id: '1234001',
  subscription_id: 'SubRef7654'
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**processing_terminal_id:** `String` — Unique identifier that we assigned to the terminal.
    
</dd>
</dl>

<dl>
<dd>

**subscription_id:** `String` — Unique identifier that the merchant assigned to the subscription.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::RepeatPayments::Subscriptions::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.repeat_payments.subscriptions.<a href="/lib/payroc/repeat_payments/subscriptions/client.rb">pay</a>(processing_terminal_id, subscription_id, request) -> Payroc::Types::SubscriptionPayment</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to manually collect a payment linked to a subscription. You can manually collect a payment only if the merchant chose not to let our gateway automatically collect each payment.  

To manually collect a payment, you need the subscriptionId of the subscription that's linked to the payment. You sent the subscriptionId in the request of the [Create Subscription](https://docs.payroc.com/api/schema/repeat-payments/subscriptions/create) method.  

**Note:** If you don't have the subscriptionId, use our [List Subscriptions](https://docs.payroc.com/api/schema/repeat-payments/subscriptions/list) method to search for the subscription.  

The request includes an order object that contains information about the amount that you want to collect.  

In the response, our gateway returns information about the payment and a paymentId. You can use the paymentId in follow-on actions with the [Payments](https://docs.payroc.com/api/schema/card-payments/payments) endpoints or [Bank Transfer Payments](https://docs.payroc.com/api/schema/bank-transfer-payments/payments) endpoints.  
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.repeat_payments.subscriptions.pay(
  processing_terminal_id: '1234001',
  subscription_id: 'SubRef7654',
  idempotency_key: '8e03978e-40d5-43e8-bc93-6894a57f9324',
  operator: 'Jane',
  order: {
    order_id: 'OrderRef6543',
    amount: 4999,
    description: 'Monthly Premium Club subscription'
  }
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**processing_terminal_id:** `String` — Unique identifier that we assigned to the terminal.
    
</dd>
</dl>

<dl>
<dd>

**subscription_id:** `String` — Unique identifier that the merchant assigned to the subscription.
    
</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String` — Unique identifier that you generate for each request. You must use the [UUID v4 format](https://www.rfc-editor.org/rfc/rfc4122) for the identifier. For more information about the idempotency key, go to [Idempotency](https://docs.payroc.com/api/idempotency).
    
</dd>
</dl>

<dl>
<dd>

**operator:** `String` — Operator who initiated the request.
    
</dd>
</dl>

<dl>
<dd>

**order:** `Payroc::Types::SubscriptionPaymentOrder` — Object that contains information about the payment.
    
</dd>
</dl>

<dl>
<dd>

**custom_fields:** `Internal::Types::Array[Payroc::Types::CustomField]` — Array of customField objects.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::RepeatPayments::Subscriptions::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Reporting Settlement
<details><summary><code>client.reporting.settlement.<a href="/lib/payroc/reporting/settlement/client.rb">list_batches</a>() -> Payroc::Reporting::Settlement::Types::ListBatchesSettlementResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to return a [paginated](https://docs.payroc.com/api/pagination) list of batches that your merchants submitted to the processor on a specific date.  

**Note:** If you want to view the details of a specific batch and you have its batchId, use our [Retrieve Batch](https://docs.payroc.com/api/schema/reporting/settlement/retrieve-batch) method.  

Use query parameters to filter the list of results that we return, for example, to search for batches that were submitted by a specific merchant.  

> **Important:** You must provide a value for the date query parameter.  

Our gateway returns the following information about each batch in the list:  
-	Transaction information, including the number of transactions and total value of sales.  
-	Merchant information, including the merchant ID (MID) and the processing account that the batch is associated with.  
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.reporting.settlement.list_batches(
  before: '2571',
  after: '8516',
  limit: 1,
  date: '2027-07-02',
  merchant_id: '4525644354'
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**before:** `String` 

Return the previous page of results before the value that you specify.  

You can’t send the before parameter in the same request as the after parameter. 
    
</dd>
</dl>

<dl>
<dd>

**after:** `String` 

Return the next page of results after the value that you specify.  

You can’t send the after parameter in the same request as the before parameter. 
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` — Limit the maximum number of results that we return for each page.
    
</dd>
</dl>

<dl>
<dd>

**date:** `String` — Filter batches by the date that they were submitted. The format of this value is **YYYY-MM-DD**.
    
</dd>
</dl>

<dl>
<dd>

**merchant_id:** `String` — Filter results by the unique identifier that the processor assigned to the merchant.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::Reporting::Settlement::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.reporting.settlement.<a href="/lib/payroc/reporting/settlement/client.rb">retrieve_batch</a>(batch_id) -> Payroc::Types::Batch</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to retrieve information about a batch.  

**Note:** To retrieve a batch, you need its batchId. If you don't have the batchId, use our [List Batches](https://docs.payroc.com/api/schema/reporting/settlement/list-batches) method to search for the batch.  

Our gateway returns the following information about the batch:  

-	Transaction information, including the number of transactions and total value of sales.  
-	Merchant information, including the merchant ID (MID) and the processing account that the batch is associated with.  
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.reporting.settlement.retrieve_batch(batch_id: 1);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**batch_id:** `Integer` — Unique identifier that we assigned to the batch.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::Reporting::Settlement::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.reporting.settlement.<a href="/lib/payroc/reporting/settlement/client.rb">list_transactions</a>() -> Payroc::Reporting::Settlement::Types::ListTransactionsSettlementResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to return a paginated list of your merchants’ transactions.  

**Note:** If you want to view the details of a specific transaction and you have its transactionId, use our [Retrieve Transaction](https://docs.payroc.com/api/schema/reporting/settlement/retrieve-transaction) method.  

Use query parameters to filter the list of results that we return, for example, to search for transactions for a specific merchant.  

> **Important:** You must provide a value for either the date query parameter or the batchId query parameter.  

Our gateway returns the following information about each transaction in the list:  

-	Merchant and processing account that ran the transaction.  
-	Transaction type, date, amount, and the payment method that the customer used.  
-	Batch that contains the transaction, and authorization details for the transaction.  
-	Processor that settled the transaction and the ACH deposit containing the transaction.  
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.reporting.settlement.list_transactions(
  before: '2571',
  after: '8516',
  limit: 1,
  date: '2024-07-02',
  batch_id: 1,
  merchant_id: '4525644354',
  transaction_type: 'Capture'
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**before:** `String` 

Return the previous page of results before the value that you specify.  

You can’t send the before parameter in the same request as the after parameter. 
    
</dd>
</dl>

<dl>
<dd>

**after:** `String` 

Return the next page of results after the value that you specify.  

You can’t send the after parameter in the same request as the before parameter. 
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` — Limit the maximum number of results that we return for each page.
    
</dd>
</dl>

<dl>
<dd>

**date:** `String` 

Filter transactions by the date that the merchant submitted the batch that contains the transaction. The format of this value is **YYYY-MM-DD**.  

You must provide either the batchId or the date. 
    
</dd>
</dl>

<dl>
<dd>

**batch_id:** `Integer` 

Filter transactions by the unique identifier of the batch that contains the transaction.  

You must provide either the batchId or the date. 
    
</dd>
</dl>

<dl>
<dd>

**merchant_id:** `String` — Filter results by the unique identifier that the processor assigned to the merchant.
    
</dd>
</dl>

<dl>
<dd>

**transaction_type:** `Payroc::Reporting::Settlement::Types::ListTransactionsSettlementRequestTransactionType` — Filter transactions by transaction type.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::Reporting::Settlement::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.reporting.settlement.<a href="/lib/payroc/reporting/settlement/client.rb">retrieve_transaction</a>(transaction_id) -> Payroc::Types::Transaction</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to retrieve information about a transaction.  

**Note:** To retrieve a transaction, you need its transactionId. If you don't have the transactionId, use our [List Transactions](https://docs.payroc.com/api/schema/reporting/settlement/list-transactions) method to search for the transaction.  

Our gateway returns the following information about the transaction:  

-	Merchant and processing account that ran the transaction.  
-	Transaction type, date, amount, and the payment method that the customer used.  
-	Batch that contains the transaction, and authorization details for the transaction.   
-	Processor that settled the transaction and the ACH deposit containing the transaction.  
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.reporting.settlement.retrieve_transaction(transaction_id: 1);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**transaction_id:** `Integer` — Unique identifier of the transaction.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::Reporting::Settlement::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.reporting.settlement.<a href="/lib/payroc/reporting/settlement/client.rb">list_authorizations</a>() -> Payroc::Reporting::Settlement::Types::ListAuthorizationsSettlementResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to retrieve a [paginated](https://docs.payroc.com/api/pagination) list of authorizations.  

Use query parameters to filter the list of results that we return, for example, to search for authorizations linked to a specific merchant.  

> **Important:** You must provide a value for either the date query parameter or the batchId query parameter.  

Our gateway returns the following information about each authorization in the list:
- Authorization response from the issuing bank.
- Amount that the issuing bank authorized.
- Merchant that ran the authorization.
- Details about the customer's card, the transaction, and the batch.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.reporting.settlement.list_authorizations(
  before: '2571',
  after: '8516',
  limit: 1,
  date: '2024-07-02',
  batch_id: 1,
  merchant_id: '4525644354'
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**before:** `String` 

Return the previous page of results before the value that you specify.  

You can’t send the before parameter in the same request as the after parameter. 
    
</dd>
</dl>

<dl>
<dd>

**after:** `String` 

Return the next page of results after the value that you specify.  

You can’t send the after parameter in the same request as the before parameter. 
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` — Limit the maximum number of results that we return for each page.
    
</dd>
</dl>

<dl>
<dd>

**date:** `String` 

Filter transactions by the date that the merchant submitted the batch that contains the transaction. The format of this value is **YYYY-MM-DD**.  

You must provide either the batchId or the date. 
    
</dd>
</dl>

<dl>
<dd>

**batch_id:** `Integer` 

Filter transactions by the unique identifier of the batch that contains the transaction.  

You must provide either the batchId or the date. 
    
</dd>
</dl>

<dl>
<dd>

**merchant_id:** `String` — Filter results by the unique identifier that the processor assigned to the merchant.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::Reporting::Settlement::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.reporting.settlement.<a href="/lib/payroc/reporting/settlement/client.rb">retrieve_authorization</a>(authorization_id) -> Payroc::Types::Authorization</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to retrieve information about an authorization.  

**Note:** To retrieve an authorization, you need its authorizationId. If you don't have the authorizationId, use our [List Authorizations](https://docs.payroc.com/api/schema/reporting/settlement/list-authorizations) method to search for the authorization.  

Our gateway returns the following information about the authorization:
- Authorization response from the issuing bank.
- Amount that the issuing bank authorized.
- Merchant that ran the authorization.
- Details about the customer's card, the transaction, and the batch.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.reporting.settlement.retrieve_authorization(authorization_id: 1);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**authorization_id:** `Integer` — Unique identifier of the authorization.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::Reporting::Settlement::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.reporting.settlement.<a href="/lib/payroc/reporting/settlement/client.rb">list_disputes</a>() -> Payroc::Reporting::Settlement::Types::ListDisputesSettlementResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to return a [paginated](https://docs.payroc.com/api/pagination) list of disputes.  

Use query parameters to filter the list of results that we return, for example, to search for disputes linked to a specific merchant.  

> **Important:** You must provide a value for the date query parameter.  

Our gateway returns the following information about each dispute in the list:  
- Its status, type, and description.  
- Transaction that the dispute is linked to, including the transaction date, merchant who ran the transaction, and the payment method that the cardholder used.  
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.reporting.settlement.list_disputes(
  before: '2571',
  after: '8516',
  limit: 1,
  date: '2024-07-02',
  merchant_id: '4525644354'
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**before:** `String` 

Return the previous page of results before the value that you specify.  

You can’t send the before parameter in the same request as the after parameter. 
    
</dd>
</dl>

<dl>
<dd>

**after:** `String` 

Return the next page of results after the value that you specify.  

You can’t send the after parameter in the same request as the before parameter. 
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` — Limit the maximum number of results that we return for each page.
    
</dd>
</dl>

<dl>
<dd>

**date:** `String` — Filter results by the date that the dispute was submitted.
    
</dd>
</dl>

<dl>
<dd>

**merchant_id:** `String` — Filter results by the unique identifier that the processor assigned to the merchant.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::Reporting::Settlement::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.reporting.settlement.<a href="/lib/payroc/reporting/settlement/client.rb">list_disputes_statuses</a>(dispute_id) -> Internal::Types::Array[Payroc::Types::DisputeStatus]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to return the status history of a dispute.  

To view the status history of a dispute, you need its disputeId. If you don't have the disputeId, use our [List Disputes](https://docs.payroc.com/api/schema/reporting/settlement/list-disputes) method to search for the dispute. 

Our gateway returns a list that contains each status change, the date it was changed, and its updated status.  
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.reporting.settlement.list_disputes_statuses(dispute_id: 1);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**dispute_id:** `Integer` — Unique identifier of the dispute.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::Reporting::Settlement::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.reporting.settlement.<a href="/lib/payroc/reporting/settlement/client.rb">list_ach_deposits</a>() -> Payroc::Reporting::Settlement::Types::ListAchDepositsSettlementResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to return a [paginated](https://docs.payroc.com/api/pagination) list of ACH deposits that we paid to your merchants.  

**Note:** If you want to view the details of a specific ACH deposit and you have its achDepositId, use our [Retrieve ACH Deposit](https://docs.payroc.com/api/schema/reporting/settlement/retrieve-ach-deposit) method.  

Use query parameters to filter the list of results that we return, for example, to search for ACH deposits that we paid to a specific merchant.  

> **Important:** You must provide a value for the date query parameter.  

Our gateway returns the following information about each ACH deposit in the list: 
- Merchant that we sent the ACH deposit to.
- Total amount that we paid the merchant.
- Breakdown of sales, returns, and fees.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.reporting.settlement.list_ach_deposits(
  before: '2571',
  after: '8516',
  limit: 1,
  date: '2024-07-02',
  merchant_id: '4525644354'
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**before:** `String` 

Return the previous page of results before the value that you specify.  

You can’t send the before parameter in the same request as the after parameter. 
    
</dd>
</dl>

<dl>
<dd>

**after:** `String` 

Return the next page of results after the value that you specify.  

You can’t send the after parameter in the same request as the before parameter. 
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` — Limit the maximum number of results that we return for each page.
    
</dd>
</dl>

<dl>
<dd>

**date:** `String` — Filter results by the date that the merchant received the ACH deposit.
    
</dd>
</dl>

<dl>
<dd>

**merchant_id:** `String` — Filter results by the unique identifier that the processor assigned to the merchant.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::Reporting::Settlement::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.reporting.settlement.<a href="/lib/payroc/reporting/settlement/client.rb">retrieve_ach_deposit</a>(ach_deposit_id) -> Payroc::Types::AchDeposit</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to retrieve information about an ACH deposit that we paid to a merchant.  

**Note:** To retrieve an ACH deposit, you need its achDepositId. If you don't have the achDepositId, use our [List ACH Deposits](https://docs.payroc.com/api/schema/reporting/settlement/list-ach-deposits) method to search for the ACH deposit.  

Our gateway returns the following information about the ACH deposit:  

- Merchant that we sent the ACH deposit to.  
- Total amount that we paid the merchant.  
- Breakdown of sales, returns, and fees.  
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.reporting.settlement.retrieve_ach_deposit(ach_deposit_id: 1);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**ach_deposit_id:** `Integer` — Unique identifier of the ACH deposit.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::Reporting::Settlement::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.reporting.settlement.<a href="/lib/payroc/reporting/settlement/client.rb">list_ach_deposit_fees</a>() -> Payroc::Reporting::Settlement::Types::ListAchDepositFeesSettlementResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve a list of ACH deposit fees.

> **Important:** You must provide a value for either the 'date' query parameter or the 'achDepositId' query parameter.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.reporting.settlement.list_ach_deposit_fees(
  before: '2571',
  after: '8516',
  limit: 1,
  date: '2024-07-02',
  ach_deposit_id: 1,
  merchant_id: '4525644354'
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**before:** `String` 

Return the previous page of results before the value that you specify.  

You can’t send the before parameter in the same request as the after parameter. 
    
</dd>
</dl>

<dl>
<dd>

**after:** `String` 

Return the next page of results after the value that you specify.  

You can’t send the after parameter in the same request as the before parameter. 
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` — Limit the maximum number of results that we return for each page.
    
</dd>
</dl>

<dl>
<dd>

**date:** `String` — Date to retrieve results from. You must provide either the 'achDepositId' or the 'date'.
    
</dd>
</dl>

<dl>
<dd>

**ach_deposit_id:** `Integer` — Unique identifier of the ACH deposit. You must provide either the 'achDepositId' or the 'date'.
    
</dd>
</dl>

<dl>
<dd>

**merchant_id:** `String` — Filter results by the unique identifier that the processor assigned to the merchant.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::Reporting::Settlement::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Tokenization SecureTokens
<details><summary><code>client.tokenization.secure_tokens.<a href="/lib/payroc/tokenization/secure_tokens/client.rb">list</a>(processing_terminal_id) -> Payroc::Types::SecureTokenPaginatedListWithAccountType</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to return a [paginated](https://docs.payroc.com/api/pagination) list of secure tokens.  

**Note:** If you want to view the details of a specific secure token and you have its secureTokenId, use our [Retrieve Secure Token](https://docs.payroc.com/api/schema/tokenization/secure-tokens/retrieve) method.  

Use query parameters to filter the list of results that we return, for example, to search for secure tokens by customer or by the first four digits of a card number.  

Our gateway returns information about the following for each secure token in the list:  

  -	Payment details that the secure token represents.  
  -	Customer details, including shipping and billing addresses.  
  -	Secure token that you can use to carry out transactions.  

  For each secure token, we also return the secureTokenId, which you can use to perform follow-on actions.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.tokenization.secure_tokens.list(
  processing_terminal_id: '1234001',
  secure_token_id: 'MREF_abc1de23-f4a5-6789-bcd0-12e345678901fa',
  customer_name: 'Sarah%20Hazel%20Hopper',
  phone: '2025550165',
  email: 'sarah.hopper@example.com',
  token: '296753123456',
  first_6: '453985',
  last_4: '7062',
  before: '2571',
  after: '8516',
  limit: 1
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**processing_terminal_id:** `String` — Unique identifier that we assigned to the terminal.
    
</dd>
</dl>

<dl>
<dd>

**secure_token_id:** `String` — Unique identifier that the merchant assigned to the secure token.
    
</dd>
</dl>

<dl>
<dd>

**customer_name:** `String` — Filter by the customer's name.
    
</dd>
</dl>

<dl>
<dd>

**phone:** `String` — Filter by the customer's phone number.
    
</dd>
</dl>

<dl>
<dd>

**email:** `String` — Filter by the customer's email address.
    
</dd>
</dl>

<dl>
<dd>

**token:** `String` — Filter by the token that the merchant used in a transaction to represent the customer's payment details.
    
</dd>
</dl>

<dl>
<dd>

**first_6:** `String` — Filter by the first six digits of the card number.
    
</dd>
</dl>

<dl>
<dd>

**last_4:** `String` — Filter by the last four digits of the card or account number.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String` 

Return the previous page of results before the value that you specify.  

You can’t send the before parameter in the same request as the after parameter. 
    
</dd>
</dl>

<dl>
<dd>

**after:** `String` 

Return the next page of results after the value that you specify.  

You can’t send the after parameter in the same request as the before parameter. 
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` — Limit the maximum number of results that we return for each page.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::Tokenization::SecureTokens::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.tokenization.secure_tokens.<a href="/lib/payroc/tokenization/secure_tokens/client.rb">create</a>(processing_terminal_id, request) -> Payroc::Types::SecureToken</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to create a secure token that represents a customer's payment details.  

When you create a secure token, you need to generate and provide a secureTokenId that you use to run follow-on actions:  
- [Retrieve Secure Token](https://docs.payroc.com/api/schema/tokenization/secure-tokens/retrieve) – View the details of the secure token.  
- [Delete Secure Token](https://docs.payroc.com/api/schema/tokenization/secure-tokens/delete) – Delete the secure token.  
- [Update Secure Token](https://docs.payroc.com/api/schema/tokenization/secure-tokens/partially-update) – Update the details of the secure token.  
- [Update Account Details](https://docs.payroc.com/api/schema/tokenization/secure-tokens/update-account) – Update the secure token with the details from a single-use token.  

**Note:** If you don't generate a secureTokenId to identify the token, our gateway generates a unique identifier and returns it in the response.  

If the request is successful, our gateway returns a token that the merchant can use in transactions instead of the customer's sensitive payment details, for example, when they [run a sale](https://docs.payroc.com/api/schema/card-payments/payments/create).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.tokenization.secure_tokens.create(
  processing_terminal_id: '1234001',
  idempotency_key: '8e03978e-40d5-43e8-bc93-6894a57f9324',
  operator: 'Jane',
  mit_agreement: 'unscheduled',
  customer: {
    first_name: 'Sarah',
    last_name: 'Hopper',
    date_of_birth: '1990-07-15',
    reference_number: 'Customer-12',
    billing_address: {
      address_1: '1 Example Ave.',
      address_2: 'Example Address Line 2',
      address_3: 'Example Address Line 3',
      city: 'Chicago',
      state: 'Illinois',
      country: 'US',
      postal_code: '60056'
    },
    shipping_address: {
      recipient_name: 'Sarah Hopper',
      address: {
        address_1: '1 Example Ave.',
        address_2: 'Example Address Line 2',
        address_3: 'Example Address Line 3',
        city: 'Chicago',
        state: 'Illinois',
        country: 'US',
        postal_code: '60056'
      }
    },
    contact_methods: [],
    notification_language: 'en'
  },
  ip_address: {
    type: 'ipv4',
    value: '104.18.24.203'
  },
  custom_fields: [{
    name: 'yourCustomField',
    value: 'abc123'
  }]
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**processing_terminal_id:** `String` — Unique identifier that we assigned to the terminal.
    
</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String` — Unique identifier that you generate for each request. You must use the [UUID v4 format](https://www.rfc-editor.org/rfc/rfc4122) for the identifier. For more information about the idempotency key, go to [Idempotency](https://docs.payroc.com/api/idempotency).
    
</dd>
</dl>

<dl>
<dd>

**secure_token_id:** `String` 

Unique identifier that the merchant created for the secure token that represents the customer's payment details. 
If the merchant doesn't create a secureTokenId, the gateway generates one and returns it in the response.
    
</dd>
</dl>

<dl>
<dd>

**operator:** `String` — Operator who saved the customer's payment details.
    
</dd>
</dl>

<dl>
<dd>

**mit_agreement:** `Payroc::Tokenization::SecureTokens::Types::TokenizationRequestMitAgreement` 

Indicates how the merchant can use the customer's card details, as agreed by the customer:  

- `unscheduled` - Transactions for a fixed or variable amount that are run at a certain pre-defined event.  
- `recurring` - Transactions for a fixed amount that are run at regular intervals, for example, monthly. Recurring transactions don't have a fixed duration and run until the customer cancels the agreement.  
- `installment` - Transactions for a fixed amount that are run at regular intervals, for example, monthly. Installment transactions have a fixed duration.
    
</dd>
</dl>

<dl>
<dd>

**customer:** `Payroc::Types::Customer` 
    
</dd>
</dl>

<dl>
<dd>

**ip_address:** `Payroc::Types::IpAddress` 
    
</dd>
</dl>

<dl>
<dd>

**source:** `Payroc::Tokenization::SecureTokens::Types::TokenizationRequestSource` 

Polymorphic object that contains the payment method to tokenize.  

The value of the type parameter determines which variant you should use:  
-	`ach` - Automated Clearing House (ACH) details
-	`pad` - Pre-authorized debit (PAD) details
-	`card` - Payment card details
-	`singleUseToken` - Single-use token details
    
</dd>
</dl>

<dl>
<dd>

**three_d_secure:** `Payroc::Tokenization::SecureTokens::Types::TokenizationRequestThreeDSecure` 

Polymorphic object that contains authentication information from 3-D Secure.  

The value of the type parameter determines which variant you should use:  
-	`gatewayThreeDSecure` - Use our gateway to run a 3-D Secure check.
-	`thirdPartyThreeDSecure` - Use a third party to run a 3-D Secure check.
    
</dd>
</dl>

<dl>
<dd>

**custom_fields:** `Internal::Types::Array[Payroc::Types::CustomField]` — Array of customField objects.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::Tokenization::SecureTokens::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.tokenization.secure_tokens.<a href="/lib/payroc/tokenization/secure_tokens/client.rb">retrieve</a>(processing_terminal_id, secure_token_id) -> Payroc::Types::SecureTokenWithAccountType</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to retrieve information about a secure token.  

To retrieve a secure token, you need its secureTokenID, which you sent in the request of the [Create Secure Token](https://docs.payroc.com/api/schema/tokenization/secure-tokens/create) method.  

**Note:** If you don't have the secureTokenId, use our [List Secure Tokens](https://docs.payroc.com/api/schema/tokenization/secure-tokens/list) method to search for the secure token.  

Our gateway returns the following information about the secure token:  

  -	Payment details that the secure token represents.  
  -	Customer details, including shipping and billing addresses.  
  -	Secure token that you can use to carry out transactions.  
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.tokenization.secure_tokens.retrieve(
  processing_terminal_id: '1234001',
  secure_token_id: 'MREF_abc1de23-f4a5-6789-bcd0-12e345678901fa'
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**processing_terminal_id:** `String` — Unique identifier that we assigned to the terminal.
    
</dd>
</dl>

<dl>
<dd>

**secure_token_id:** `String` — Unique identifier that the merchant assigned to the secure token.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::Tokenization::SecureTokens::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.tokenization.secure_tokens.<a href="/lib/payroc/tokenization/secure_tokens/client.rb">delete</a>(processing_terminal_id, secure_token_id) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to delete a secure token and its related payment details from our vault.  

To delete a secure token, you need its secureTokenId, which you sent in the request of the [Create Secure Token](https://docs.payroc.com/api/schema/tokenization/secure-tokens/create) method.  

**Note:** If you don’t have the secureTokenId, use our [List Secure Tokens](https://docs.payroc.com/api/schema/tokenization/secure-tokens/list) method to search for the secure token.  

When you delete a secure token, you can’t recover it, and you can’t reuse its identifier for a new token.  
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.tokenization.secure_tokens.delete(
  processing_terminal_id: '1234001',
  secure_token_id: 'MREF_abc1de23-f4a5-6789-bcd0-12e345678901fa'
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**processing_terminal_id:** `String` — Unique identifier that we assigned to the terminal.
    
</dd>
</dl>

<dl>
<dd>

**secure_token_id:** `String` — Unique identifier that the merchant assigned to the secure token.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::Tokenization::SecureTokens::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.tokenization.secure_tokens.<a href="/lib/payroc/tokenization/secure_tokens/client.rb">partially_update</a>(processing_terminal_id, secure_token_id, request) -> Payroc::Types::SecureToken</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to partially update a secure token. Structure your request to follow the [RFC 6902](https://datatracker.ietf.org/doc/html/rfc6902) standard.  

To update a secure token, you need its secureTokenId, which you sent in the request of the [Create Secure Token](https://docs.payroc.com/api/schema/tokenization/secure-tokens/create) method.  

**Note:** If you don't have the secureTokenId, use our [List Secure Tokens](https://docs.payroc.com/api/schema/tokenization/secure-tokens/list) method to search  for the payment.  

You can update all of the properties of the secure token, except the following:  
- processingTerminalId  
- type  
- token  
- status  
- source/Card  
  - type  
  - cardNumber  
  - cardType  
  - currency  
  - debit  
  - surcharging  
- source/ACH account  
  - accountNumber  
  - routingNumber  
- source/PAD account  
  - type  
  - accountNumber  
  - transitNumber  
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.tokenization.secure_tokens.partially_update(
  processing_terminal_id: '1234001',
  secure_token_id: 'MREF_abc1de23-f4a5-6789-bcd0-12e345678901fa',
  idempotency_key: '8e03978e-40d5-43e8-bc93-6894a57f9324',
  request: []
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**processing_terminal_id:** `String` — Unique identifier that we assigned to the terminal.
    
</dd>
</dl>

<dl>
<dd>

**secure_token_id:** `String` — Unique identifier that the merchant assigned to the secure token.
    
</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String` — Unique identifier that you generate for each request. You must use the [UUID v4 format](https://www.rfc-editor.org/rfc/rfc4122) for the identifier. For more information about the idempotency key, go to [Idempotency](https://docs.payroc.com/api/idempotency).
    
</dd>
</dl>

<dl>
<dd>

**request:** `Internal::Types::Array[Payroc::Types::PatchDocument]` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::Tokenization::SecureTokens::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.tokenization.secure_tokens.<a href="/lib/payroc/tokenization/secure_tokens/client.rb">update_account</a>(processing_terminal_id, secure_token_id, request) -> Payroc::Types::SecureToken</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to update a secure token if you have a single-use token from Hosted Fields.  

**Note:** If you don't have a single-use token, you can update saved payment details with our [Update Secure Token](https://docs.payroc.com/api/resources#updateSecureToken) method. For more information about our two options to update a secure token, go to [Update saved payment details](https://docs.payroc.com/guides/take-payments/update-saved-payment-details).  
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.tokenization.secure_tokens.update_account(
  processing_terminal_id: '1234001',
  secure_token_id: 'MREF_abc1de23-f4a5-6789-bcd0-12e345678901fa',
  idempotency_key: '8e03978e-40d5-43e8-bc93-6894a57f9324'
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**processing_terminal_id:** `String` — Unique identifier that we assigned to the terminal.
    
</dd>
</dl>

<dl>
<dd>

**secure_token_id:** `String` — Unique identifier that the merchant assigned to the secure token.
    
</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String` — Unique identifier that you generate for each request. You must use the [UUID v4 format](https://www.rfc-editor.org/rfc/rfc4122) for the identifier. For more information about the idempotency key, go to [Idempotency](https://docs.payroc.com/api/idempotency).
    
</dd>
</dl>

<dl>
<dd>

**request:** `Payroc::Types::AccountUpdate` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::Tokenization::SecureTokens::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Tokenization SingleUseTokens
<details><summary><code>client.tokenization.single_use_tokens.<a href="/lib/payroc/tokenization/single_use_tokens/client.rb">create</a>(processing_terminal_id, request) -> Payroc::Types::SingleUseToken</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this method to create a single-use token that represents a customer’s payment details.  

A single-use token expires after 30 minutes and merchants can use them only once.  

**Note:** To create a reusable permanent token, go to [Create Secure Token](https://docs.payroc.com/api/schema/tokenization/secure-tokens/create).  

In the request, send the customer’s payment details. If the request is successful, our gateway returns a token that you can use in a follow-on action, for example, [run a sale](https://docs.payroc.com/api/schema/card-payments/payments/create).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.tokenization.single_use_tokens.create(
  processing_terminal_id: '1234001',
  idempotency_key: '8e03978e-40d5-43e8-bc93-6894a57f9324',
  channel: 'web',
  operator: 'Jane'
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**processing_terminal_id:** `String` — Unique identifier that our gateway assigned to the terminal.
    
</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String` — Unique identifier that you generate for each request. You must use the [UUID v4 format](https://www.rfc-editor.org/rfc/rfc4122) for the identifier. For more information about the idempotency key, go to [Idempotency](https://docs.payroc.com/api/idempotency).
    
</dd>
</dl>

<dl>
<dd>

**channel:** `Payroc::Tokenization::SingleUseTokens::Types::SingleUseTokenRequestChannel` — Channel that the merchant used to receive the payment details.
    
</dd>
</dl>

<dl>
<dd>

**operator:** `String` — Operator who initiated the request.
    
</dd>
</dl>

<dl>
<dd>

**source:** `Payroc::Tokenization::SingleUseTokens::Types::SingleUseTokenRequestSource` 

Polymorphic object that contains the payment method to tokenize.  

The value of the type parameter determines which variant you should use:  
-	`ach` - Automated Clearing House (ACH) details
-	`pad` - Pre-authorized debit (PAD) details
-	`card` - Payment card details
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Payroc::Tokenization::SingleUseTokens::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

class EmailBatcherMailer < ApplicationMailer
	default :from => 'nt@vensera.com'

	def send_email_for_new_product(customer)
    @customer = customer
    mail( :to => @customer.email,
    :subject => 'Sản phẩm mới cho bé từ Vensera' )
  end
end

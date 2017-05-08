class EmailWorker
  include Sidekiq::Worker

  def perform(ids)
    ids.each do |id|
    	EmailBatcherMailer.send_email_for_new_product(Customer.find(id)).deliver
    end
  end
end

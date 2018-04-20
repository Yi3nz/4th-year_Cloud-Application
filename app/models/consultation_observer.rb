class ConsultationObserver < ActiveRecord::Observer

  # Define the callbacks method to log specific messages
  def around_save(model)
    model.logger.info("state around_save")
    yield
    model.logger.info("end around_save")
  end

  def after_save(consultation)
    consultation.logger.info("New consultation successfully saved!")
  end

  def after_create(consultation)
    consultation.logger.info('New consultation created.')
  end

  def after_destroy(consultation)
    consultation.logger.warn("Consultation with an id of #{consultation.id} was deleted!")
  end
end

class ConsultationObserver < ActiveRecord::Observer
  observe :consultation, :patient

  def around_save(model)
    puts "state around_save"
    yield
    puts "end around_save"
  end

  def after_save(consultation)
    Notifications.consultation("admin@do.com", "New c was posted", consultation).deliver
  end

  #sends an email when a Comment#save is finished.
  def after_create(consultation)
    consultation.logger.info('New contact added!')
  end

  def after_destroy(consultation)
    consultation.logger.warn("Contact with an id of #{consultation.id} was destroyed!")
  end
end

module ApplicationHelper
  def admin?
   current_user.admin
  end
  def salesrep?
    current_user.salesrep == true
  end
  def time
    time_tag Time.current
  end
end

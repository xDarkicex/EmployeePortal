module ApplicationHelper
  def admin?
   current_user.admin
  end
  def salesrep?
    current_user.salesrep
  end
end

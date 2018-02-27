module ColorHelper
  def hours_color(h)
    working_hours = User.current_months_full_working_hours

    case
      when h < 0.1 * working_hours then 'F8766D'
      when h < 0.2 * working_hours then 'F98370'
      when h < 0.3 * working_hours then 'FA9072'
      when h < 0.4 * working_hours then 'FA9D75'
      when h < 0.5 * working_hours then 'FBAA77'
      when h < 0.6 * working_hours then 'FCB77A'
      when h < 0.7 * working_hours then 'FCC47C'
      when h < 0.8 * working_hours then 'FDD17F'
      when h < 0.9 * working_hours then 'FEE182'
      when h < 1.0 * working_hours then 'B1D580'
      when h < 1.1 * working_hours then '63BE7B'
      else '10852F'
    end
  end
end

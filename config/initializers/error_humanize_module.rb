module ErrorHumanizeModule
  def error_message
    self.errors.collect{|k,v| "#{k} #{v}"}.join(" ").to_s
  end
end
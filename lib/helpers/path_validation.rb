module PathValidation
  def valid_filepath?(pathname)
    return pathname.exist?
  end

  def pathname_error!
    raise PathnameError.new "Invalid pathname, please provide a valid pathname"
  end


  def pathname(file_path)
    @pathname ||= begin
      Pathname.new(file_path).cleanpath.expand_path
    rescue TypeError => e
      log_and_raise e
    end
  end

end

class PathnameError < StandardError; end
Handler = Proc.new do |req, res|
  n = rand

  res.status = 200

  if req.accept.includes? 'application/json'
    res['Content-Type'] = 'application/json; charset=utf-8'
    res.body %Q!{"value":#{n}}!
    return
  end

  res['Content-Type'] = 'text/plain; charset=utf-8'
  res.body = n.to_s
end

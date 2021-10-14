Handler = Proc.new do |req, res|
  n = rand

  res['Content-Type'] = 'text/plain; charset=utf-8'
  res.status = 200
  res.body = n.to_s
end

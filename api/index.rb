Handler = Proc.new do |req, res|
  max = req.query['max']
  min = req.query['min']

  case (max ? 0b01 : 0b00) + (min ? 0b10 : 0b00)
  when 0b00
    n = rand
  when 0b01
    n = rand(max.to_i + 1)
  when 0b10
    res.status = 400
    res.body = 'parameter "min" requires parameter "max"'
    next
  when 0b11
    n = rand min.to_i..max.to_i
  end

  res.status = 200

  if req['Accept'].include? 'application/json'
    res['Content-Type'] = 'application/json; charset=utf-8'
    res.body = %Q!{"value":#{n}}!
    next
  end

  res['Content-Type'] = 'text/plain; charset=utf-8'
  res.body = n.to_s
end

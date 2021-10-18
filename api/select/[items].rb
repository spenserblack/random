Handler = Proc.new do |req, res|
  separator = req.query['separator']
  separator = ',' if separator.nil? || separator.empty?
  items = req.query['items'].split separator
  item = items.sample

  res.status = 200

  if req['Accept'].include? 'application/json'
    res['Content-Type'] = 'application/json; charset=utf-8'
    res.body = %Q!{"value":#{item}}!
    next
  end

  res['Content-Type'] = 'text/plain; charset=utf-8'
  res.body = item

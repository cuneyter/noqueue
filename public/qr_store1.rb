require 'rqrcode'
codes = [1, 2, 3, 4, 5, 6]
codes.each do |code|
    qrcode = RQRCode::QRCode.new("http://www.noqueue.online/stores/#{code}")
    # NOTE: showing with default options specified explicitly
    png = qrcode.as_png(
    bit_depth: 1,
    border_modules: 4,
    color_mode: ChunkyPNG::COLOR_GRAYSCALE,
    color: 'black',
    file: nil,
    fill: 'white',
    module_px_size: 6,
    resize_exactly_to: false,
    resize_gte_to: false,
    size: 600
    )
    IO.binwrite("qr_code#{code}.png", png.to_s)
end

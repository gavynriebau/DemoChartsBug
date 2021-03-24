import SwiftUI
import Combine
import Charts

struct LineChartViewController: UIViewRepresentable {
    var cancellables: [AnyCancellable] = []
    
    var data: [ChartDataEntry] = (0...10)
        .map { Double($0) }
        .map { ChartDataEntry(x: $0, y: pow($0, 2.0)) }
    
    init() {
    }

    func makeUIView(context: Context) -> LineChartView {
        let view = LineChartView()
        view.autoScaleMinMaxEnabled = true
        view.data = LineChartData(dataSet: LineChartDataSet(entries: self.data))
        view.isUserInteractionEnabled = true
        view.dragXEnabled = false
        view.dragYEnabled = false
        view.pinchZoomEnabled = false
        view.doubleTapToZoomEnabled = false
        view.legend.enabled = false

        view.setNeedsDisplay()
        return view
    }

    func updateUIView(_ lineChart: LineChartView, context: Context) {
        lineChart.data = LineChartData(dataSet: LineChartDataSet(entries: self.data))
        lineChart.setNeedsDisplay()
    }
}

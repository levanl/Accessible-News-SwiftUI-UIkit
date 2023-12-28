//
//  NewsPageView.swift
//  Accessible News
//
//  Created by Levan Loladze on 27.12.23.
//

import SwiftUI

struct NewsPageView: View {
    
    // MARK: - Properties
    @EnvironmentObject private var viewModel: NewsPageViewModel
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            NewsTableViewRepresentable(data: viewModel.articles)
                .padding()
                .navigationBarTitle("News")
                .accessibility(label: Text("News Feed"))
        }
    }
}


// MARK: - ViewRepresentable
struct NewsTableViewRepresentable: UIViewRepresentable {
    
    // MARK: - Properties
    var data: [Article]
    
    func makeUIView(context: Context) -> UITableView {
        let tableView = UITableView()
        tableView.dataSource = context.coordinator
        tableView.delegate = context.coordinator as? UITableViewDelegate
        tableView.register(NewsTableViewCell.self, forCellReuseIdentifier: "Cell")
        return tableView
    }
    
    func updateUIView(_ uiView: UITableView, context: Context) {
        context.coordinator.data = data
        uiView.reloadData()
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(data: data)
    }
    
    // MARK: - Body
    // აქ final უნდა? :დდ
    class Coordinator: NSObject, UITableViewDataSource {
        
        // MARK: - Properties
        var data: [Article]
        
        init(data: [Article]) {
            self.data = data
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return data.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! NewsTableViewCell
            let newsItem = data[indexPath.row]
            cell.configure(with: newsItem)
            return cell
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            // TODO: Navigate to detailsPageView
        }
    }
    
}

#Preview {
    NewsPageView()
        .environmentObject(NewsPageViewModel())
}





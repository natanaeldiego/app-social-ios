//
//  PostView.swift
//  App-Social
//
//  Created by Natanael Diego on 12/04/21.
//

import SwiftUI

struct PostView: View {
    
    var nameUser: String
    var idUser: Int
    
    @EnvironmentObject
    var viewModel: PostViewModel
    
    init?(nameUser: String, idUser: Int) {
        self.nameUser = nameUser
        self.idUser = idUser
    }
    
    var body: some View {
        NavigationView {
            Group {
                List {
                    ForEach(viewModel.detailUser) { detail in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(detail.title).font(.title2)
                                Text(detail.body).font(.subheadline)
                            }
                            .padding()
                            Spacer()
                        }
                    }
                }
                .navigationTitle(self.nameUser)
             }
        }
        .onAppear {
            viewModel.detailUsers(idUser: self.idUser)
        }
    }
    
    private func showLoading() -> some View {
        return VStack {
            ProgressView()
            Text("Aguarde! Carregando..")
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(nameUser:"", idUser: 0)
    }
}

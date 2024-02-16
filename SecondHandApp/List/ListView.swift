//
//  ListView.swift
//  SecondHandApp
//
//  Created by 임주영 on 2024/02/15.
//

import SwiftUI
import ComposableArchitecture

struct ListView: View {
    var body: some View {
        Text("ListView")
    }
}

#Preview {
    ListView()
}

struct Product: Reducer {
    @ObservableState
    struct State: Equatable, Identifiable {
        var name: String
        var description: String
        var price: Int
        let id: UUID
    }
    
    enum Action: BindableAction {
        case binding(BindingAction<State>)
    }
    
    var body: some Reducer<State, Action> {
        BindingReducer()
    }
}

struct ProductView: View {
    let store: StoreOf<Product>

    var body: some View {
        WithViewStore(store, observe: {$0}) { viewStore in
            HStack {
                EmptyView()
                    .frame(width: 80, height: 80)
                    .background(.gray)
                
                VStack {
                    Text(store.name)
                        .font(.title)
                    Text(store.description)
                        .font(.subheadline)
                }
            }
        }
    }
}

struct ProductList: Reducer {
    @ObservableState
    struct State: Equatable {
        var products: IdentifiedArrayOf<Product.State> = []
    }
    
    enum Action {
        case fetch
        case response(IdentifiedArrayOf<Product.State>)
    }
    
    func reduce(into state: inout State, action: Action) -> ComposableArchitecture.Effect<Action> {
        
        switch action {
        case .fetch:
            return .run { send in
                let list: [Product.State] = [
                    .init(name: "테스트1", description: "테스트디스크립션", price: 333, id: UUID()),
                    .init(name: "테스트12", description: "테스트디스크립션2", price: 3333, id: UUID()),
                    .init(name: "테스트13", description: "테스트디스크립션3", price: 3332, id: UUID()),
                    .init(name: "테스트14", description: "테스트디스크립션4", price: 3331, id: UUID()),
                    .init(name: "테스트15", description: "테스트디스크립션5", price: 3338, id: UUID())
                ]
                //send(.response(.init(arrayLiteral: <#T##Product.State...##Product.State#>)))
            }
            return .none
        case .response(let products):
            state.products = products
            
        }
    }
    
}

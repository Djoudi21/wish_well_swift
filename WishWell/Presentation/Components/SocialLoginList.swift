//
//  SocialLoginList.swift
//  SwiftTemplate
//
//  Created by Abdelkrim Djoudi on 29/09/2024.
//

import SwiftUI

struct SocialLoginList: View {
    @ObservedObject var viewModel: LoginViewModel // Use ObservedObject

    var body: some View {
        HStack {
            SocialLogin(viewModel: viewModel)
            SocialLogin(viewModel: viewModel)
        }    }
}

#Preview {
    let viewModel = LoginViewModel()
    return SocialLoginList(viewModel: viewModel)
}

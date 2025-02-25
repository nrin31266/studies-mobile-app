package com.nrin31266.kiemtraso1.ui.navigation

import androidx.compose.runtime.Composable
import androidx.navigation.NavHostController
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import com.nrin31266.kiemtraso1.ui.screens.DetailScreen
import com.nrin31266.kiemtraso1.ui.screens.HomeScreen


@Composable
fun NavGraph(navController: NavHostController) {
    NavHost(navController = navController, startDestination = "home") {
        composable("home") { HomeScreen(navController) }
        composable("detail/{productId}") { backStackEntry ->
            val productId = backStackEntry.arguments?.getString("productId") ?: ""
            DetailScreen(navController, productId)
        }
    }
}

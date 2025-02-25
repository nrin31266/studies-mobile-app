package com.nrin31266.kiemtraso1.ui.screens

import android.util.Log
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.ShoppingCart
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.unit.dp
import androidx.navigation.NavController
import com.google.gson.Gson
import com.google.gson.reflect.TypeToken
import com.nrin31266.kiemtraso1.model.Product
import com.nrin31266.kiemtraso1.ui.components.ProductCard
import kotlinx.serialization.decodeFromString
import kotlinx.serialization.json.Json

@Composable
fun ProductScreen(navController: NavController) {
    val jsonString = """
    [
        {
            "id": "1",
            "imageUrl": "https://cdn.michill.jp/img/articles/147160/1.jpg",
            "title": "Men's Casual Shirt",
            "description": "95% Cotton, 5% Spandex, Casual, Short Sleeve, V-Neck",
            "rating": 4.5,
            "price": "12.99"
        },
        {
            "id": "2",
            "imageUrl": "https://th.bing.com/th/id/OIP.Z8r1g1hJfwiWvAeOJv9NEwHaJ4?rs=1&pid=ImgDetMain",
            "title": "Black Trousers",
            "description": "100% Cotton, Comfortable & Stylish",
            "rating": 4.2,
            "price": "15.99"
        }
    ]
"""

    val gson = Gson()
    val productList: List<Product> = try {
        val type = object : TypeToken<List<Product>>() {}.type
        gson.fromJson(jsonString, type) ?: emptyList()
    } catch (e: Exception) {
        e.printStackTrace()
        emptyList()
    }

    Log.d("ProductList", productList.toString())

    LazyColumn(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp)
    ) {
        items(productList) { product ->
            ProductCard(product, onClick = {
                navController.navigate("detail/${1}")
            })
        }
    }
}


@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun HomeScreen(navController: NavController) {
    Column(modifier = Modifier.fillMaxSize()) {

        TopAppBar(
            title = { Text("List Product") },
            actions = {
                IconButton(onClick = {}) {
                    Icon(imageVector = Icons.Default.ShoppingCart, contentDescription = "Filter", tint = Color.White)
                }
            },
            colors = TopAppBarDefaults.topAppBarColors(
                containerColor = Color(0xFF6200EE),
                titleContentColor = Color.White
            )
        )

        ProductScreen(navController)
    }
}

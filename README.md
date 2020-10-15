# Sizabl.io

> System Design Capstone

## Related Projects

 - https://github.com/Sizabl-io/calendar-reservations
 - https://github.com/Sizabl-io/review-service
 - https://github.com/Sizabl-io/Photo-Gallery-Service
 - https://github.com/Sizabl-io/people-also-viewed

## Table of Contents

1. [Usage](#Usage)
1. [Requirements](#requirements)
1. [Development](#development)

## Usage - Server API

### CREATE - Add a restaurant
  * POST `/api/alsoViewed/restaurants`

**Success Status Code:** `201`

**Request Body**: Expects JSON with the following keys.

```json
    {
    "id": "Integer",
    "name": "String",
    "rating": "Integer",
    "num_of_reviews": "Integer",
    "how_pricey": "Integer",
    "cuisine_id": "Integer",
    "display_img_url": "String",
    "heart": "Boolean",
    "super_rated": "Boolean"
    }
```

### CREATE - Add a review to a specific restaurant
  * POST `/api/alsoViewed/reviews`

**Success Status Code:** `201`

**Request Body**: Expects JSON with the following keys.

```json
    {
    "id": "Integer",
    "avatar_url": "String",
    "name": "String",
    "date": "String",
    "review": "String",
    "rating": "Integer",
    "restaurant_id": "Integer"
    }
```

### READ - Get specific restaurant info
  * GET `/api/alsoViewed/restaurants/:id`

**Path Parameters:**
  * `id` | restaurant id

**Success Status Code:** `200`

**Returns:** JSON

```json
    {
    "id": "Integer",
    "name": "String",
    "rating": "Integer",
    "num_of_reviews": "Integer",
    "how_pricey": "Integer",
    "cuisine_id": "Array",
    "display_img_url": "String",
    "heart": "Boolean",
    "super_rated": "Boolean"
    }
```

### READ - Get all reviews of a specific restaurant
  * GET `/api/alsoViewed/reviews/:restaurant_id`

**Path Parameters:**
  * `restaurant_id` | restaurant id

**Success Status Code:** `200`

**Returns:** JSON

```json
   [{
    "id": "Integer",
    "avatar_url": "String",
    "name": "String",
    "date": "String",
    "review": "String",
    "rating": "Integer",
    "restaurant_id": "Integer"
    },
    {
    "id": "Integer",
    "avatar_url": "String",
    "name": "String",
    "date": "String",
    "review": "String",
    "rating": "Integer",
    "restaurant_id": "Integer"
    }]
```

### UPDATE - Update a specific restaurant rating
  * PATCH `/api/alsoViewed/restaurants/:id`

**Path Parameters:**
  * `id` | restaurant id

**Success Status Code:** `204`

**Request Body**: Expects JSON with following key

```json
    {
    "rating": "Integer"
    }
```

### UPDATE - Update a specific review rating
  * PATCH `/api/alsoViewed/reviews/:id`

**Path Parameters:**
  * `id` | review id

**Success Status Code:** `204`

**Request Body**: Expects JSON with following key

```json
    {
    "rating": "Integer"
    }
```

### DELETE - Delete a specific restaurant
  * DELETE `/api/alsoViewed/restaurants/:id`

**Path Parameters:**
  * `id` | restaurant id

**Success Status Code:** `204`

### DELETE - Delete a specific review
  * DELETE `/api/alsoViewed/reviews/:id`

**Path Parameters:**
  * `id` | review id

**Success Status Code:** `204`

## Requirements

An `nvmrc` file is included if using [nvm](https://github.com/creationix/nvm).

- Node 6.13.0
- etc

## Development

### Installing Dependencies

From within the root directory:

```sh
npm install -g webpack
npm install
```

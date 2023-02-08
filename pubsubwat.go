package pubsubwat

import (
	"context"
	"fmt"

	gcps "cloud.google.com/go/pubsub"
)

func main() error {

	client, err := gcps.NewClient(context.Background(), "testproject")
	if err != nil {
		return err
	}

	fmt.Printf("Client: %v", client)

	return nil

}

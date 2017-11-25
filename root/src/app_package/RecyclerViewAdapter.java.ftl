package ${packageName};

import butterknife.BindView;
import butterknife.ButterKnife;

import android.content.Context;
import android.graphics.Bitmap;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import com.android.volley.RequestQueue;
import com.android.volley.toolbox.ImageLoader;
import com.android.volley.toolbox.NetworkImageView;


import ${packageName}.${className}.OnListFragmentInteractionListener;
import ${packageName}.dummy.DummyContent.DummyItem;

import java.util.List;

/**
 * {@link RecyclerView.Adapter} that can display a {@link DummyItem} and makes a call to the
 * specified {@link OnListFragmentInteractionListener}.
 * TODO: Replace the implementation with code for your data type.
 */
public class ${adapterClassName} extends RecyclerView.Adapter<${adapterClassName}.ViewHolder> {

    private final List<${objectClass}> mValues;
    private final OnListFragmentInteractionListener mListener;
    private final ImageLoader imageLoader;

    public ${adapterClassName}(List<${objectClass}> items, Context context, OnListFragmentInteractionListener listener) {
        mValues = items;
        mListener = listener;
        RequestQueue requestQueue = NetworkManager.getInstance().getRequestQueue(this.getClass().getName(), context);
        imageLoader = new ImageLoader(requestQueue, new ImageLoader.ImageCache() {
            // TODO: implement the right image cache
            public Bitmap getBitmap(String url) {return null;}
            public void putBitmap(String url, Bitmap bitmap) {}
        });
    }

    @Override
    public ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(parent.getContext())
                .inflate(R.layout.${fragment_layout}, parent, false);
        return new ViewHolder(view);
    }

    @Override
    public void onBindViewHolder(final ViewHolder holder, int position) {
        holder.mItem = mValues.get(position);
        holder.mTitle.setText("Title");
        holder.mDetails.setText("Details");
        // Update this code to load the thumbnail image
        // holder.mThumbnail.setImageUrl(holder.mItem.imageUrl,  imageLoader);

        holder.itemView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (null != mListener) {
                    // Notify the active callbacks interface (the activity, if the
                    // fragment is attached to one) that an item has been selected.
                    mListener.onListFragmentInteraction(holder.mItem);
                }
            }
        });
    }

    @Override
    public int getItemCount() {
        return mValues.size();
    }

    public class ViewHolder extends RecyclerView.ViewHolder {

        @BindView(R.id.image)
        NetworkImageView mThumbnail;
        
        @BindView(R.id.title)
        TextView mTitle;

        @BindView(R.id.details)
        TextView mDetails;

        public ${objectClass} mItem;

        public ViewHolder(View view) {
            super(view);
            ButterKnife.bind(this, view);
        }

        @Override
        public String toString() {
            return super.toString() + " '" + mTitle.getText() + "'";
        }
    }
}

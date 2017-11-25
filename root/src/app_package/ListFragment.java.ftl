package ${packageName};

import android.content.Context;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v7.widget.GridLayoutManager;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Toast;
import android.widget.ViewSwitcher;

import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import com.google.gson.GsonBuilder;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import butterknife.BindView;
import butterknife.ButterKnife;

import java.lang.reflect.Type;

<#if applicationPackage??>
import ${applicationPackage}.R;
</#if>
import ${packageName}.dummy.DummyContent;
import ${packageName}.dummy.DummyContent.DummyItem;

import java.util.List;

/**
 * A fragment representing a list of Items.
 * <p />
 * Activities containing this fragment MUST implement the {@link OnListFragmentInteractionListener}
 * interface.

     TODO: Add these to build.gradle app
     compile 'com.jakewharton:butterknife:8.8.1'
     annotationProcessor 'com.jakewharton:butterknife-compiler:8.8.1'
 
 */
public class ${className} extends Fragment {

   @BindView(R.id.list) 
   RecyclerView recyclerView;

   @BindView(R.id.switcher)
   ViewSwitcher switcher;

   Gson gson;

    // TODO: Customize parameters
    private int mColumnCount = ${columnCount};

<#if includeFactory>
    // TODO: Customize parameter argument names
    private static final String ARG_COLUMN_COUNT = "column-count";

    // TODO: Change this to the desired URL
    private static final String URL = "http://www.google.com";


</#if>
    // The queue for Volley request
    RequestQueue requestQueue;

    private OnListFragmentInteractionListener mListener;

<#if includeFactory>
    // TODO: Customize parameter initialization
    @SuppressWarnings("unused")
    public static ${className} newInstance(int columnCount) {
        ${className} fragment = new ${className}();
        Bundle args = new Bundle();
        args.putInt(ARG_COLUMN_COUNT, columnCount);
        fragment.setArguments(args);
        return fragment;
    }

</#if>
    /**
     * Mandatory empty constructor for the fragment manager to instantiate the
     * fragment (e.g. upon screen orientation changes).
     */
    public ${className}() {
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

<#if includeFactory>
        if (getArguments() != null) {
            mColumnCount = getArguments().getInt(ARG_COLUMN_COUNT);
        }
</#if>
    }

    @Override
    public void onActivityCreated(Bundle bundle) {
        super.onActivityCreated(bundle);
        requestQueue = NetworkManager.getInstance().getRequestQueue(this.getClass().getName(), getContext());
        gson = new GsonBuilder().create();
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.${fragment_layout_list}, container, false);
        ButterKnife.bind(this, view);
        
        
        Context context = view.getContext();
        // Configure the recyclerview with layout manager    
        if (mColumnCount <= 1) {
            recyclerView.setLayoutManager(new LinearLayoutManager(context));
        } else {
            recyclerView.setLayoutManager(new GridLayoutManager(context, mColumnCount));
        }                       
        makeNetworkRequest();
        return view;
    }
    

    private String buildUrl() {
        throw new RuntimeException("Implement me!");
    }


    private void makeNetworkRequest() {
        final StringRequest stringRequest = new StringRequest(buildUrl(), new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                // todo: handle response
                Type listType = new TypeToken<List<${objectClass}>>() {}.getType();
                List<${objectClass}> list = gson.fromJson(response, listType);
                recyclerView.setAdapter(new ${adapterClassName}(list, getContext(), mListener));
            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                // show error
                Toast.makeText(getContext(), "Error " + error, Toast.LENGTH_SHORT).show();
            }
        });
        requestQueue.add(stringRequest);

    }


    @Override
    public void onAttach(Context context) {
        super.onAttach(context);
        if (context instanceof OnListFragmentInteractionListener) {
            mListener = (OnListFragmentInteractionListener) context;
        } else {
            throw new RuntimeException(context.toString()
                    + " must implement OnListFragmentInteractionListener");
        }
    }

    @Override
    public void onDetach() {
        super.onDetach();
        mListener = null;
    }

    /**
     * This interface must be implemented by activities that contain this
     * fragment to allow an interaction in this fragment to be communicated
     * to the activity and potentially other fragments contained in that
     * activity.
     * <p/>
     * See the Android Training lesson <a href=
     * "http://developer.android.com/training/basics/fragments/communicating.html"
     * >Communicating with Other Fragments</a> for more information.
     */
    public interface OnListFragmentInteractionListener {
        // TODO: Update argument type and name
        void onListFragmentInteraction(${objectClass} item);
    }
}

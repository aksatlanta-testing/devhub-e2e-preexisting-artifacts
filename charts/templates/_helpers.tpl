
{{- define "go-echo3e972a18-7157-4790-93ac-8ac68021a2ad.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3e972a18-7157-4790-93ac-8ac68021a2ad.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{- define "go-echo3e972a18-7157-4790-93ac-8ac68021a2ad.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3e972a18-7157-4790-93ac-8ac68021a2ad.labels" -}}
helm.sh/chart: {{ include "go-echo3e972a18-7157-4790-93ac-8ac68021a2ad.chart" . }}
{{ include "go-echo3e972a18-7157-4790-93ac-8ac68021a2ad.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo3e972a18-7157-4790-93ac-8ac68021a2ad.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo3e972a18-7157-4790-93ac-8ac68021a2ad.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
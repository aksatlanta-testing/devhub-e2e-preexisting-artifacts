
{{- define "go-echof806bb38-3f09-4c24-9c63-3dfd8fc82dcc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof806bb38-3f09-4c24-9c63-3dfd8fc82dcc.fullname" -}}
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


{{- define "go-echof806bb38-3f09-4c24-9c63-3dfd8fc82dcc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof806bb38-3f09-4c24-9c63-3dfd8fc82dcc.labels" -}}
helm.sh/chart: {{ include "go-echof806bb38-3f09-4c24-9c63-3dfd8fc82dcc.chart" . }}
{{ include "go-echof806bb38-3f09-4c24-9c63-3dfd8fc82dcc.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof806bb38-3f09-4c24-9c63-3dfd8fc82dcc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof806bb38-3f09-4c24-9c63-3dfd8fc82dcc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
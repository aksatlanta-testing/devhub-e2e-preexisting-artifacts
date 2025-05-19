
{{- define "go-echoba047e64-3929-497f-8c81-d7099cd54fff.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoba047e64-3929-497f-8c81-d7099cd54fff.fullname" -}}
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


{{- define "go-echoba047e64-3929-497f-8c81-d7099cd54fff.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoba047e64-3929-497f-8c81-d7099cd54fff.labels" -}}
helm.sh/chart: {{ include "go-echoba047e64-3929-497f-8c81-d7099cd54fff.chart" . }}
{{ include "go-echoba047e64-3929-497f-8c81-d7099cd54fff.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoba047e64-3929-497f-8c81-d7099cd54fff.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoba047e64-3929-497f-8c81-d7099cd54fff.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
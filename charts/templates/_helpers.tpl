
{{- define "go-echoa52270b2-6e38-45b2-b783-3975812657c0.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa52270b2-6e38-45b2-b783-3975812657c0.fullname" -}}
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


{{- define "go-echoa52270b2-6e38-45b2-b783-3975812657c0.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa52270b2-6e38-45b2-b783-3975812657c0.labels" -}}
helm.sh/chart: {{ include "go-echoa52270b2-6e38-45b2-b783-3975812657c0.chart" . }}
{{ include "go-echoa52270b2-6e38-45b2-b783-3975812657c0.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa52270b2-6e38-45b2-b783-3975812657c0.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa52270b2-6e38-45b2-b783-3975812657c0.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
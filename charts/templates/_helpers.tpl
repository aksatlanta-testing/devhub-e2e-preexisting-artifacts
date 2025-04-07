
{{- define "go-echo97520b0e-6104-43ce-9b40-9de6410919de.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo97520b0e-6104-43ce-9b40-9de6410919de.fullname" -}}
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


{{- define "go-echo97520b0e-6104-43ce-9b40-9de6410919de.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo97520b0e-6104-43ce-9b40-9de6410919de.labels" -}}
helm.sh/chart: {{ include "go-echo97520b0e-6104-43ce-9b40-9de6410919de.chart" . }}
{{ include "go-echo97520b0e-6104-43ce-9b40-9de6410919de.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo97520b0e-6104-43ce-9b40-9de6410919de.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo97520b0e-6104-43ce-9b40-9de6410919de.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
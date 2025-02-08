
{{- define "go-echofee1c1c3-8e51-466f-893f-4b7b8da2952d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofee1c1c3-8e51-466f-893f-4b7b8da2952d.fullname" -}}
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


{{- define "go-echofee1c1c3-8e51-466f-893f-4b7b8da2952d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofee1c1c3-8e51-466f-893f-4b7b8da2952d.labels" -}}
helm.sh/chart: {{ include "go-echofee1c1c3-8e51-466f-893f-4b7b8da2952d.chart" . }}
{{ include "go-echofee1c1c3-8e51-466f-893f-4b7b8da2952d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofee1c1c3-8e51-466f-893f-4b7b8da2952d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofee1c1c3-8e51-466f-893f-4b7b8da2952d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
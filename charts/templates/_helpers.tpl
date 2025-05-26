
{{- define "go-echo909290c3-4cb8-44dd-a01f-ce1cdaaa2d0e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo909290c3-4cb8-44dd-a01f-ce1cdaaa2d0e.fullname" -}}
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


{{- define "go-echo909290c3-4cb8-44dd-a01f-ce1cdaaa2d0e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo909290c3-4cb8-44dd-a01f-ce1cdaaa2d0e.labels" -}}
helm.sh/chart: {{ include "go-echo909290c3-4cb8-44dd-a01f-ce1cdaaa2d0e.chart" . }}
{{ include "go-echo909290c3-4cb8-44dd-a01f-ce1cdaaa2d0e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo909290c3-4cb8-44dd-a01f-ce1cdaaa2d0e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo909290c3-4cb8-44dd-a01f-ce1cdaaa2d0e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
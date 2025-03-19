
{{- define "go-echo004f7342-95f4-4fba-a8d8-165fed53ffae.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo004f7342-95f4-4fba-a8d8-165fed53ffae.fullname" -}}
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


{{- define "go-echo004f7342-95f4-4fba-a8d8-165fed53ffae.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo004f7342-95f4-4fba-a8d8-165fed53ffae.labels" -}}
helm.sh/chart: {{ include "go-echo004f7342-95f4-4fba-a8d8-165fed53ffae.chart" . }}
{{ include "go-echo004f7342-95f4-4fba-a8d8-165fed53ffae.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo004f7342-95f4-4fba-a8d8-165fed53ffae.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo004f7342-95f4-4fba-a8d8-165fed53ffae.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
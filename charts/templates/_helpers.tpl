
{{- define "go-echob9f6ca7e-cdfb-4f6a-a227-ff08b0268cfb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob9f6ca7e-cdfb-4f6a-a227-ff08b0268cfb.fullname" -}}
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


{{- define "go-echob9f6ca7e-cdfb-4f6a-a227-ff08b0268cfb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob9f6ca7e-cdfb-4f6a-a227-ff08b0268cfb.labels" -}}
helm.sh/chart: {{ include "go-echob9f6ca7e-cdfb-4f6a-a227-ff08b0268cfb.chart" . }}
{{ include "go-echob9f6ca7e-cdfb-4f6a-a227-ff08b0268cfb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob9f6ca7e-cdfb-4f6a-a227-ff08b0268cfb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob9f6ca7e-cdfb-4f6a-a227-ff08b0268cfb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
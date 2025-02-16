
{{- define "go-echob9f4eba3-ce3e-4126-a83c-956d48532ea9.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob9f4eba3-ce3e-4126-a83c-956d48532ea9.fullname" -}}
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


{{- define "go-echob9f4eba3-ce3e-4126-a83c-956d48532ea9.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob9f4eba3-ce3e-4126-a83c-956d48532ea9.labels" -}}
helm.sh/chart: {{ include "go-echob9f4eba3-ce3e-4126-a83c-956d48532ea9.chart" . }}
{{ include "go-echob9f4eba3-ce3e-4126-a83c-956d48532ea9.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob9f4eba3-ce3e-4126-a83c-956d48532ea9.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob9f4eba3-ce3e-4126-a83c-956d48532ea9.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}